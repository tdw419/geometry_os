; DESCRIPTION: Composite: Sets a single purple pixel at (334, 221) then Renders a blue box of size 108x83 starting at (259, 38).
; PLAN: r0=334(x), r1=221(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=38(y), r7=108(width), r8=83(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 221
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 259
LDI r6, 38
LDI r7, 108
LDI r8, 83
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
