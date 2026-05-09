; DESCRIPTION: Draws a cyan rectangle at (194, 165) with width 77 and height 82.
; PLAN: r0=194(x), r1=165(y), r2=77(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 165
LDI r2, 77
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
