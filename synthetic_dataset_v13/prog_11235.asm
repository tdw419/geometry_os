; DESCRIPTION: Composite: Draws a red circle centered at (287, 182) with radius 65 then Creates a magenta rectangular region at (42, 61) spanning 92 by 75 pixels.
; PLAN: r0=287(x), r1=182(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=42(x), r6=61(y), r7=92(width), r8=75(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 182
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 42
LDI r6, 61
LDI r7, 92
LDI r8, 75
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
