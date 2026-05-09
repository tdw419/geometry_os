; DESCRIPTION: Composite: Renders a white box of size 53x115 starting at (54, 53) then Places a magenta dot at position (404, 185).
; PLAN: r0=54(x), r1=53(y), r2=53(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=404(x), r6=185(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 54
LDI r1, 53
LDI r2, 53
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 185
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
