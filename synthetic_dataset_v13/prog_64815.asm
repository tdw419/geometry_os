; DESCRIPTION: Composite: Places a red circle of radius 64 at center (423, 176) then Places a green line segment connecting (4, 211) to (486, 16).
; PLAN: r0=423(x), r1=176(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x1), r6=211(y1), r7=486(x2), r8=16(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 176
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 211
LDI r7, 486
LDI r8, 16
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
