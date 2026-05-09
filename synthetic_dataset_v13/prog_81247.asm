; DESCRIPTION: Composite: Renders a orange line between points (195, 167) and (352, 220) then Places a magenta dot at position (244, 113).
; PLAN: r0=195(x1), r1=167(y1), r2=352(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=244(x), r6=113(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 195
LDI r1, 167
LDI r2, 352
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 244
LDI r6, 113
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
