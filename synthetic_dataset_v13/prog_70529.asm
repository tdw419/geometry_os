; DESCRIPTION: Renders a white box of size 33x34 starting at (442, 48).
; PLAN: r0=442(x), r1=48(y), r2=33(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 48
LDI r2, 33
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
