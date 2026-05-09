; DESCRIPTION: Composite: Renders a magenta line between points (467, 50) and (67, 44) then Places a white dot at position (263, 163).
; PLAN: r0=467(x1), r1=50(y1), r2=67(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=263(x), r6=163(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 467
LDI r1, 50
LDI r2, 67
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 163
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
