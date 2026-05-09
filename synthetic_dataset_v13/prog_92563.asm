; DESCRIPTION: Renders a white box of size 10x119 starting at (480, 81).
; PLAN: r0=480(x), r1=81(y), r2=10(width), r3=119(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 81
LDI r2, 10
LDI r3, 119
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
