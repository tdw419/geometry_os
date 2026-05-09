; DESCRIPTION: Renders a blue box of size 31x12 starting at (210, 96).
; PLAN: r0=210(x), r1=96(y), r2=31(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 96
LDI r2, 31
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
