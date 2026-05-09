; DESCRIPTION: Composite: Sets a single cyan pixel at (32, 31) then Draws a white rectangle at (383, 40) with width 36 and height 66.
; PLAN: r0=32(x), r1=31(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=383(x), r6=40(y), r7=36(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 32
LDI r1, 31
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 383
LDI r6, 40
LDI r7, 36
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
