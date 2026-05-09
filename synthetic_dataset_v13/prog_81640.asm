; DESCRIPTION: Renders a white box of size 35x70 starting at (414, 107).
; PLAN: r0=414(x), r1=107(y), r2=35(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 107
LDI r2, 35
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
