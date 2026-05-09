; DESCRIPTION: Composite: Renders a blue line between points (463, 117) and (103, 239) then Places a blue dot at position (119, 193).
; PLAN: r0=463(x1), r1=117(y1), r2=103(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=193(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 463
LDI r1, 117
LDI r2, 103
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 193
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
