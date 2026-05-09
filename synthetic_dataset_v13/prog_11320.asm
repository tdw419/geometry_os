; DESCRIPTION: Composite: Places a white dot at position (402, 107) then Places a black line segment connecting (368, 25) to (254, 68).
; PLAN: r0=402(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=368(x1), r6=25(y1), r7=254(x2), r8=68(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 368
LDI r6, 25
LDI r7, 254
LDI r8, 68
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
