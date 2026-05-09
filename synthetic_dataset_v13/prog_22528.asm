; DESCRIPTION: Composite: Places a green line segment connecting (403, 251) to (198, 196) then Draws a red circle centered at (271, 103) with radius 45.
; PLAN: r0=403(x1), r1=251(y1), r2=198(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=103(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 403
LDI r1, 251
LDI r2, 198
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 103
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
