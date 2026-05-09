; DESCRIPTION: Draws a cyan rectangle at (263, 162) with width 116 and height 49.
; PLAN: r0=263(x), r1=162(y), r2=116(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 162
LDI r2, 116
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
