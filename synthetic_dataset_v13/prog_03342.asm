; DESCRIPTION: Renders a blue box of size 93x19 starting at (412, 21).
; PLAN: r0=412(x), r1=21(y), r2=93(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 21
LDI r2, 93
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
