; DESCRIPTION: Renders a blue box of size 82x49 starting at (370, 196).
; PLAN: r0=370(x), r1=196(y), r2=82(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 196
LDI r2, 82
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
