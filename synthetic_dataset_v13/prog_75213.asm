; DESCRIPTION: Composite: Sets a single blue pixel at (31, 113) then Renders a red box of size 34x92 starting at (99, 44).
; PLAN: r0=31(x), r1=113(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=99(x), r6=44(y), r7=34(width), r8=92(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 113
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 99
LDI r6, 44
LDI r7, 34
LDI r8, 92
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
