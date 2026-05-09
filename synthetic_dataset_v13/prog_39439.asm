; DESCRIPTION: Composite: Renders a cyan line between points (434, 86) and (435, 15) then Places a blue dot at position (377, 173).
; PLAN: r0=434(x1), r1=86(y1), r2=435(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=173(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 434
LDI r1, 86
LDI r2, 435
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 173
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
