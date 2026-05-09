; DESCRIPTION: Renders a blue box of size 97x95 starting at (262, 57).
; PLAN: r0=262(x), r1=57(y), r2=97(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 57
LDI r2, 97
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
