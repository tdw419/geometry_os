; DESCRIPTION: Composite: Renders a black line between points (233, 98) and (338, 116) then Places a red dot at position (410, 120).
; PLAN: r0=233(x1), r1=98(y1), r2=338(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=410(x), r6=120(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 233
LDI r1, 98
LDI r2, 338
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 120
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
