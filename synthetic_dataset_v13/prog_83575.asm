; DESCRIPTION: Renders a white box of size 23x55 starting at (24, 128).
; PLAN: r0=24(x), r1=128(y), r2=23(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 128
LDI r2, 23
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
