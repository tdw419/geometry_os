; DESCRIPTION: Draws a cyan rectangle at (171, 105) with width 103 and height 64.
; PLAN: r0=171(x), r1=105(y), r2=103(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 105
LDI r2, 103
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
