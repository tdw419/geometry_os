; DESCRIPTION: Composite: Places a cyan line segment connecting (364, 174) to (503, 53) then Creates a green circular shape at (271, 77) with radius 57.
; PLAN: r0=364(x1), r1=174(y1), r2=503(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=77(y), r7=57(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 364
LDI r1, 174
LDI r2, 503
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 77
LDI r7, 57
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
