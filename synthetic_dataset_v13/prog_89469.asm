; DESCRIPTION: Composite: Places a white line segment connecting (378, 184) to (386, 17) then Places a yellow 117x10 rectangle at position (139, 115).
; PLAN: r0=378(x1), r1=184(y1), r2=386(x2), r3=17(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=139(x), r6=115(y), r7=117(width), r8=10(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 184
LDI r2, 386
LDI r3, 17
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 139
LDI r6, 115
LDI r7, 117
LDI r8, 10
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
