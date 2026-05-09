; DESCRIPTION: Renders a white box of size 53x83 starting at (393, 120).
; PLAN: r0=393(x), r1=120(y), r2=53(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 120
LDI r2, 53
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
