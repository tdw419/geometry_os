; DESCRIPTION: Composite: Renders a cyan line between points (410, 237) and (44, 17) then Places a white dot at position (29, 175).
; PLAN: r0=410(x1), r1=237(y1), r2=44(x2), r3=17(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=175(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 410
LDI r1, 237
LDI r2, 44
LDI r3, 17
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 175
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
