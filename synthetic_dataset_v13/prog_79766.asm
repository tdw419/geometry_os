; DESCRIPTION: Composite: Sets a single white pixel at (469, 143) then Draws a white rectangle at (410, 12) with width 41 and height 16.
; PLAN: r0=469(x), r1=143(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=12(y), r7=41(width), r8=16(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 469
LDI r1, 143
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 410
LDI r6, 12
LDI r7, 41
LDI r8, 16
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
