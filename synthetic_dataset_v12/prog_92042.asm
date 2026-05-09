; DESCRIPTION: Renders a blue box of size 84x115 starting at (317, 124).
; PLAN: r0=317(x), r1=124(y), r2=84(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 124
LDI r2, 84
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
