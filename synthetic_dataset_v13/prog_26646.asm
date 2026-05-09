; DESCRIPTION: Composite: Renders a green line between points (203, 100) and (239, 26) then Places a white dot at position (353, 187).
; PLAN: r0=203(x1), r1=100(y1), r2=239(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=353(x), r6=187(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 203
LDI r1, 100
LDI r2, 239
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 353
LDI r6, 187
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
