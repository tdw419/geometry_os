; DESCRIPTION: Composite: Sets a single cyan pixel at (77, 68) then Draws a orange rectangle at (288, 184) with width 69 and height 47.
; PLAN: r0=77(x), r1=68(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=184(y), r7=69(width), r8=47(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 68
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 184
LDI r7, 69
LDI r8, 47
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
