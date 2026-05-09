; DESCRIPTION: Composite: Creates a blue circular shape at (392, 103) with radius 74 then Places a green line segment connecting (360, 182) to (459, 74).
; PLAN: r0=392(x), r1=103(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x1), r6=182(y1), r7=459(x2), r8=74(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 392
LDI r1, 103
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 182
LDI r7, 459
LDI r8, 74
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
