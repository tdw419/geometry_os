; DESCRIPTION: Renders a white box of size 68x90 starting at (115, 51).
; PLAN: r0=115(x), r1=51(y), r2=68(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 51
LDI r2, 68
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
