; DESCRIPTION: Composite: Places a magenta line segment connecting (87, 210) to (299, 116) then Places a orange dot at position (320, 199).
; PLAN: r0=87(x1), r1=210(y1), r2=299(x2), r3=116(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=199(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 87
LDI r1, 210
LDI r2, 299
LDI r3, 116
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 199
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
