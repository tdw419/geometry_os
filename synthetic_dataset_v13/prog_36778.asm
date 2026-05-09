; DESCRIPTION: Composite: Renders a cyan line between points (463, 159) and (329, 20) then Places a cyan dot at position (121, 13).
; PLAN: r0=463(x1), r1=159(y1), r2=329(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=121(x), r6=13(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 463
LDI r1, 159
LDI r2, 329
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 121
LDI r6, 13
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
