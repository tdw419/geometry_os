; DESCRIPTION: Composite: Creates a red rectangular region at (263, 102) spanning 107 by 63 pixels then Renders a magenta disk with center (286, 112) and radius 25.
; PLAN: r0=263(x), r1=102(y), r2=107(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=112(y), r7=25(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 102
LDI r2, 107
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 112
LDI r7, 25
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
