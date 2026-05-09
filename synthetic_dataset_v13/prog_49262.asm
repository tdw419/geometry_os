; DESCRIPTION: Places a blue 26x77 rectangle at position (296, 100).
; PLAN: r0=296(x), r1=100(y), r2=26(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 100
LDI r2, 26
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
