; DESCRIPTION: Renders a white box of size 23x109 starting at (176, 51).
; PLAN: r0=176(x), r1=51(y), r2=23(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 51
LDI r2, 23
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
