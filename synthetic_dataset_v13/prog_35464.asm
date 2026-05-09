; DESCRIPTION: Renders a white box of size 103x98 starting at (181, 26).
; PLAN: r0=181(x), r1=26(y), r2=103(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 26
LDI r2, 103
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
