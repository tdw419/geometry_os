; DESCRIPTION: Composite: Places a red line segment connecting (243, 177) to (48, 244) then Draws a yellow circle centered at (374, 102) with radius 77.
; PLAN: r0=243(x1), r1=177(y1), r2=48(x2), r3=244(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=102(y), r7=77(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 243
LDI r1, 177
LDI r2, 48
LDI r3, 244
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 102
LDI r7, 77
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
