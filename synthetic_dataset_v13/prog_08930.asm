; DESCRIPTION: Composite: Places a white dot at position (41, 41) then Places a black line segment connecting (264, 45) to (320, 143).
; PLAN: r0=41(x), r1=41(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=264(x1), r6=45(y1), r7=320(x2), r8=143(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 41
LDI r1, 41
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 264
LDI r6, 45
LDI r7, 320
LDI r8, 143
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
