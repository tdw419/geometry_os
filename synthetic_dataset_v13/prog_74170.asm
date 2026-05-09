; DESCRIPTION: Composite: Places a orange circle of radius 60 at center (452, 186) then Places a red dot at position (270, 197).
; PLAN: r0=452(x), r1=186(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=197(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 452
LDI r1, 186
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 197
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
