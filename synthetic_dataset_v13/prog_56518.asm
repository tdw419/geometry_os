; DESCRIPTION: Composite: Creates a white rectangular region at (383, 111) spanning 47 by 119 pixels then Renders a red disk with center (127, 72) and radius 41.
; PLAN: r0=383(x), r1=111(y), r2=47(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=127(x), r6=72(y), r7=41(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 111
LDI r2, 47
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 72
LDI r7, 41
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
