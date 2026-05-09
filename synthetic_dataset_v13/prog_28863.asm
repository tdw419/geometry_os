; DESCRIPTION: Composite: Places a blue dot at position (412, 161) then Places a white line segment connecting (373, 36) to (2, 137).
; PLAN: r0=412(x), r1=161(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=373(x1), r6=36(y1), r7=2(x2), r8=137(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 161
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 373
LDI r6, 36
LDI r7, 2
LDI r8, 137
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
