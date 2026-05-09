; DESCRIPTION: Composite: Draws a red line from (426, 37) to (493, 224) then Creates a yellow circular shape at (288, 197) with radius 15.
; PLAN: r0=426(x1), r1=37(y1), r2=493(x2), r3=224(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=197(y), r7=15(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 426
LDI r1, 37
LDI r2, 493
LDI r3, 224
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 197
LDI r7, 15
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
