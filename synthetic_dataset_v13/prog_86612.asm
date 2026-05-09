; DESCRIPTION: Composite: Places a purple dot at position (46, 184) then Renders a blue box of size 10x73 starting at (14, 137) then Renders a green line between points (149, 151) and (401, 57).
; PLAN: r0=46(x), r1=184(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=14(x), r6=137(y), r7=10(width), r8=73(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=149(x1), r11=151(y1), r12=401(x2), r13=57(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 184
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 14
LDI r6, 137
LDI r7, 10
LDI r8, 73
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 151
LDI r12, 401
LDI r13, 57
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
