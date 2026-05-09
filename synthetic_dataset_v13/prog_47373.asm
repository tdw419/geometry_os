; DESCRIPTION: Composite: Sets a single cyan pixel at (7, 147) then Draws a white rectangle at (33, 96) with width 107 and height 53.
; PLAN: r0=7(x), r1=147(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=33(x), r6=96(y), r7=107(width), r8=53(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 7
LDI r1, 147
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 33
LDI r6, 96
LDI r7, 107
LDI r8, 53
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
