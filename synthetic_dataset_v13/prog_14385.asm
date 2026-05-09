; DESCRIPTION: Renders a white box of size 18x109 starting at (475, 99).
; PLAN: r0=475(x), r1=99(y), r2=18(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 99
LDI r2, 18
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
