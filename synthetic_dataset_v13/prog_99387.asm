; DESCRIPTION: Renders a blue box of size 15x35 starting at (75, 60).
; PLAN: r0=75(x), r1=60(y), r2=15(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 60
LDI r2, 15
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
