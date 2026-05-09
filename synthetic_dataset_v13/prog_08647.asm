; DESCRIPTION: Composite: Sets a single blue pixel at (34, 191) then Draws a white rectangle at (0, 180) with width 36 and height 40.
; PLAN: r0=34(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=0(x), r6=180(y), r7=36(width), r8=40(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 0
LDI r6, 180
LDI r7, 36
LDI r8, 40
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
