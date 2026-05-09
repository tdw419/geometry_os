; DESCRIPTION: Renders a blue box of size 31x72 starting at (386, 1).
; PLAN: r0=386(x), r1=1(y), r2=31(width), r3=72(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 1
LDI r2, 31
LDI r3, 72
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
