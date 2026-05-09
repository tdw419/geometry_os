; DESCRIPTION: Composite: Sets a single white pixel at (26, 193) then Draws a cyan rectangle at (283, 55) with width 96 and height 34.
; PLAN: r0=26(x), r1=193(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=283(x), r6=55(y), r7=96(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 193
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 283
LDI r6, 55
LDI r7, 96
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
