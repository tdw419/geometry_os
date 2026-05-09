; DESCRIPTION: Renders a white box of size 120x51 starting at (366, 163).
; PLAN: r0=366(x), r1=163(y), r2=120(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 163
LDI r2, 120
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
