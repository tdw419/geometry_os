; DESCRIPTION: Composite: Places a red line segment connecting (78, 180) to (236, 75) then Places a green circle of radius 32 at center (334, 37).
; PLAN: r0=78(x1), r1=180(y1), r2=236(x2), r3=75(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=37(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 78
LDI r1, 180
LDI r2, 236
LDI r3, 75
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 37
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
