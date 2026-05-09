; DESCRIPTION: Composite: Draws a yellow circle centered at (242, 130) with radius 25 then Sets a single purple pixel at (497, 146) then Draws a orange line from (365, 56) to (448, 62).
; PLAN: r0=242(x), r1=130(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=497(x), r6=146(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=365(x1), r11=56(y1), r12=448(x2), r13=62(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 130
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 497
LDI r6, 146
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 365
LDI r11, 56
LDI r12, 448
LDI r13, 62
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
