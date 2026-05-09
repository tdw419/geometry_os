; DESCRIPTION: Renders a white box of size 36x14 starting at (464, 10).
; PLAN: r0=464(x), r1=10(y), r2=36(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 10
LDI r2, 36
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
