; DESCRIPTION: Composite: Places a cyan line segment connecting (235, 223) to (313, 154) then Places a red dot at position (183, 41).
; PLAN: r0=235(x1), r1=223(y1), r2=313(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=183(x), r6=41(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 235
LDI r1, 223
LDI r2, 313
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 41
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
