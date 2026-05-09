; DESCRIPTION: Draws a cyan rectangle at (173, 66) with width 120 and height 113.
; PLAN: r0=173(x), r1=66(y), r2=120(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 66
LDI r2, 120
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
