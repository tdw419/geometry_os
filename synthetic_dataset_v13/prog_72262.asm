; DESCRIPTION: Composite: Sets a single green pixel at (307, 1) then Creates a magenta rectangular region at (121, 40) spanning 17 by 88 pixels.
; PLAN: r0=307(x), r1=1(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=40(y), r7=17(width), r8=88(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 1
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 121
LDI r6, 40
LDI r7, 17
LDI r8, 88
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
