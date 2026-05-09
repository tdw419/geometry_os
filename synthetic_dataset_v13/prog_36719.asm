; DESCRIPTION: Composite: Creates a white circular shape at (287, 222) with radius 10 then Places a yellow line segment connecting (108, 32) to (486, 213).
; PLAN: r0=287(x), r1=222(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=108(x1), r6=32(y1), r7=486(x2), r8=213(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 222
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 108
LDI r6, 32
LDI r7, 486
LDI r8, 213
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
