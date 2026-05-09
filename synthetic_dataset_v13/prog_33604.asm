; DESCRIPTION: Composite: Places a magenta dot at position (46, 216) then Places a green 52x99 rectangle at position (255, 152) then Renders a purple line between points (106, 158) and (53, 239).
; PLAN: r0=46(x), r1=216(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=152(y), r7=52(width), r8=99(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=106(x1), r11=158(y1), r12=53(x2), r13=239(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 216
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 255
LDI r6, 152
LDI r7, 52
LDI r8, 99
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 106
LDI r11, 158
LDI r12, 53
LDI r13, 239
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
