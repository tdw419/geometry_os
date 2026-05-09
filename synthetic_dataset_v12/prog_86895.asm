; DESCRIPTION: Composite: Renders a cyan line between points (450, 109) and (198, 82) then Places a blue dot at position (25, 83).
; PLAN: r0=450(x1), r1=109(y1), r2=198(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=25(x), r6=83(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 450
LDI r1, 109
LDI r2, 198
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 83
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
