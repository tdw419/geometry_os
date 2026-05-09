; DESCRIPTION: Renders a white box of size 35x71 starting at (32, 47).
; PLAN: r0=32(x), r1=47(y), r2=35(width), r3=71(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 47
LDI r2, 35
LDI r3, 71
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
