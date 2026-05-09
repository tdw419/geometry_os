; DESCRIPTION: Renders a white box of size 83x83 starting at (73, 18).
; PLAN: r0=73(x), r1=18(y), r2=83(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 18
LDI r2, 83
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
