; DESCRIPTION: Renders a blue box of size 111x92 starting at (383, 77).
; PLAN: r0=383(x), r1=77(y), r2=111(width), r3=92(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 77
LDI r2, 111
LDI r3, 92
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
