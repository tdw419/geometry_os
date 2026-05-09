; DESCRIPTION: Composite: Places a yellow circle of radius 78 at center (198, 96) then Draws a magenta line from (109, 164) to (41, 237) then Sets a single purple pixel at (458, 6).
; PLAN: r0=198(x), r1=96(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x1), r6=164(y1), r7=41(x2), r8=237(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=458(x), r11=6(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 198
LDI r1, 96
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 164
LDI r7, 41
LDI r8, 237
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 6
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
