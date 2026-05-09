; DESCRIPTION: Composite: Creates a magenta rectangular region at (19, 47) spanning 112 by 10 pixels then Places a yellow dot at position (286, 211).
; PLAN: r0=19(x), r1=47(y), r2=112(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=211(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 19
LDI r1, 47
LDI r2, 112
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 211
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
