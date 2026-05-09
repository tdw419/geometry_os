; DESCRIPTION: Composite: Renders a magenta box of size 112x57 starting at (399, 194) then Sets a single green pixel at (329, 171).
; PLAN: r0=399(x), r1=194(y), r2=112(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=171(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 399
LDI r1, 194
LDI r2, 112
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 171
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
