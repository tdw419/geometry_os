; DESCRIPTION: Draws a white rectangle at (474, 132) with width 27 and height 103.
; PLAN: r0=474(x), r1=132(y), r2=27(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 132
LDI r2, 27
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
