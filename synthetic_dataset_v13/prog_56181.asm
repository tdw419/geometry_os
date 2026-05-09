; DESCRIPTION: Draws a cyan rectangle at (285, 143) with width 113 and height 105.
; PLAN: r0=285(x), r1=143(y), r2=113(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 143
LDI r2, 113
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
