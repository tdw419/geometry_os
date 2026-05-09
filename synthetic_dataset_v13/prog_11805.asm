; DESCRIPTION: Composite: Creates a magenta rectangular region at (305, 166) spanning 41 by 47 pixels then Renders a black disk with center (214, 111) and radius 54.
; PLAN: r0=305(x), r1=166(y), r2=41(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=214(x), r6=111(y), r7=54(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 305
LDI r1, 166
LDI r2, 41
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 214
LDI r6, 111
LDI r7, 54
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
