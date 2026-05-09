; DESCRIPTION: Composite: Draws a red line from (273, 115) to (224, 253) then Draws a magenta circle centered at (38, 37) with radius 37.
; PLAN: r0=273(x1), r1=115(y1), r2=224(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=37(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 273
LDI r1, 115
LDI r2, 224
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 37
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
