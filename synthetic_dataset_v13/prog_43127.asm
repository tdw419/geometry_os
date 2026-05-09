; DESCRIPTION: Composite: Creates a green rectangular region at (199, 22) spanning 107 by 73 pixels then Places a magenta dot at position (27, 113).
; PLAN: r0=199(x), r1=22(y), r2=107(width), r3=73(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x), r6=113(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 199
LDI r1, 22
LDI r2, 107
LDI r3, 73
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 113
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
