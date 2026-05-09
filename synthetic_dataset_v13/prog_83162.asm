; DESCRIPTION: Composite: Sets a single orange pixel at (393, 188) then Renders a green box of size 11x113 starting at (360, 4) then Renders a blue line between points (215, 191) and (431, 40).
; PLAN: r0=393(x), r1=188(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=360(x), r6=4(y), r7=11(width), r8=113(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=215(x1), r11=191(y1), r12=431(x2), r13=40(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 188
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 360
LDI r6, 4
LDI r7, 11
LDI r8, 113
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 191
LDI r12, 431
LDI r13, 40
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
