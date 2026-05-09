; DESCRIPTION: Composite: Renders a orange line between points (228, 252) and (415, 150) then Places a purple dot at position (408, 210).
; PLAN: r0=228(x1), r1=252(y1), r2=415(x2), r3=150(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=408(x), r6=210(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 252
LDI r2, 415
LDI r3, 150
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 210
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
