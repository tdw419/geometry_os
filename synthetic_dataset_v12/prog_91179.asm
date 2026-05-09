; DESCRIPTION: Renders a white box of size 26x71 starting at (464, 113).
; PLAN: r0=464(x), r1=113(y), r2=26(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 113
LDI r2, 26
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
