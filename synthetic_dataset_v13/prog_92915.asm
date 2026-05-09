; DESCRIPTION: Renders a white box of size 64x113 starting at (434, 84).
; PLAN: r0=434(x), r1=84(y), r2=64(width), r3=113(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 84
LDI r2, 64
LDI r3, 113
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
