; DESCRIPTION: Renders a white box of size 65x83 starting at (157, 74).
; PLAN: r0=157(x), r1=74(y), r2=65(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 74
LDI r2, 65
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
