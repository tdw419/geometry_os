; DESCRIPTION: Composite: Places a white dot at position (511, 122) then Renders a white box of size 60x107 starting at (277, 122).
; PLAN: r0=511(x), r1=122(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=277(x), r6=122(y), r7=60(width), r8=107(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 511
LDI r1, 122
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 277
LDI r6, 122
LDI r7, 60
LDI r8, 107
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
