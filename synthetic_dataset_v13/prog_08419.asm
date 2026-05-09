; DESCRIPTION: Renders a blue box of size 58x49 starting at (410, 2).
; PLAN: r0=410(x), r1=2(y), r2=58(width), r3=49(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 2
LDI r2, 58
LDI r3, 49
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
