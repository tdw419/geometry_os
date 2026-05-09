; DESCRIPTION: Renders a white box of size 39x24 starting at (339, 48).
; PLAN: r0=339(x), r1=48(y), r2=39(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 48
LDI r2, 39
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
