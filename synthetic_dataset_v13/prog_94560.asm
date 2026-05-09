; DESCRIPTION: Composite: Places a red line segment connecting (48, 216) to (503, 140) then Places a purple dot at position (501, 183) then Renders a cyan box of size 66x32 starting at (87, 183).
; PLAN: r0=48(x1), r1=216(y1), r2=503(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=501(x), r6=183(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=183(y), r12=66(width), r13=32(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 216
LDI r2, 503
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 183
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 87
LDI r11, 183
LDI r12, 66
LDI r13, 32
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
