; DESCRIPTION: Renders a white box of size 56x40 starting at (212, 142).
; PLAN: r0=212(x), r1=142(y), r2=56(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 142
LDI r2, 56
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
