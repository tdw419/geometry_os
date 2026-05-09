; DESCRIPTION: Composite: Places a blue dot at position (278, 178) then Places a white line segment connecting (220, 9) to (333, 139).
; PLAN: r0=278(x), r1=178(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=220(x1), r6=9(y1), r7=333(x2), r8=139(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 178
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 220
LDI r6, 9
LDI r7, 333
LDI r8, 139
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
