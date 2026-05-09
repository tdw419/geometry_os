; DESCRIPTION: Composite: Creates a blue circular shape at (332, 117) with radius 61 then Places a yellow line segment connecting (233, 231) to (503, 222).
; PLAN: r0=332(x), r1=117(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x1), r6=231(y1), r7=503(x2), r8=222(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 332
LDI r1, 117
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 231
LDI r7, 503
LDI r8, 222
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
