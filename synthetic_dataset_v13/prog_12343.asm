; DESCRIPTION: Renders a blue box of size 27x29 starting at (115, 132).
; PLAN: r0=115(x), r1=132(y), r2=27(width), r3=29(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 132
LDI r2, 27
LDI r3, 29
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
