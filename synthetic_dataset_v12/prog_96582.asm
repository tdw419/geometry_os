; DESCRIPTION: Draws a cyan rectangle at (199, 239) with width 81 and height 16.
; PLAN: r0=199(x), r1=239(y), r2=81(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 239
LDI r2, 81
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
