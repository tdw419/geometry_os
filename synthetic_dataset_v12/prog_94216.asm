; DESCRIPTION: Composite: Sets a single blue pixel at (213, 2) then Draws a red rectangle at (208, 203) with width 34 and height 38.
; PLAN: r0=213(x), r1=2(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=208(x), r6=203(y), r7=34(width), r8=38(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 2
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 208
LDI r6, 203
LDI r7, 34
LDI r8, 38
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
