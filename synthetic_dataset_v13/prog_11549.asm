; DESCRIPTION: Renders a white box of size 30x87 starting at (464, 99).
; PLAN: r0=464(x), r1=99(y), r2=30(width), r3=87(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 99
LDI r2, 30
LDI r3, 87
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
