; DESCRIPTION: Draws a cyan rectangle at (239, 135) with width 60 and height 103.
; PLAN: r0=239(x), r1=135(y), r2=60(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 135
LDI r2, 60
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
