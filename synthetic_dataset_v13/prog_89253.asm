; DESCRIPTION: Composite: Renders a cyan disk with center (156, 138) and radius 78 then Creates a magenta rectangular region at (119, 127) spanning 82 by 43 pixels.
; PLAN: r0=156(x), r1=138(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=119(x), r6=127(y), r7=82(width), r8=43(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 138
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 119
LDI r6, 127
LDI r7, 82
LDI r8, 43
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
