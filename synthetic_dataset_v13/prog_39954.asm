; DESCRIPTION: Draws a cyan rectangle at (352, 146) with width 106 and height 95.
; PLAN: r0=352(x), r1=146(y), r2=106(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 146
LDI r2, 106
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
