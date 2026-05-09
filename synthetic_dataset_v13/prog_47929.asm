; DESCRIPTION: Renders a white box of size 43x97 starting at (164, 120).
; PLAN: r0=164(x), r1=120(y), r2=43(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 120
LDI r2, 43
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
