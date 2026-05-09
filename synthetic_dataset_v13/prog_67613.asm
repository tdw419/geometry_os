; DESCRIPTION: Composite: Renders a cyan line between points (91, 179) and (364, 221) then Places a blue dot at position (420, 28).
; PLAN: r0=91(x1), r1=179(y1), r2=364(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=28(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 91
LDI r1, 179
LDI r2, 364
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 28
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
