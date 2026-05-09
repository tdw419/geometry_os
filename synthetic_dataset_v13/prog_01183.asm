; DESCRIPTION: Renders a blue box of size 31x47 starting at (57, 121).
; PLAN: r0=57(x), r1=121(y), r2=31(width), r3=47(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 121
LDI r2, 31
LDI r3, 47
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
