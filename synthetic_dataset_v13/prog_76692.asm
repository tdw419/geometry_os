; DESCRIPTION: Renders a blue box of size 50x55 starting at (322, 80).
; PLAN: r0=322(x), r1=80(y), r2=50(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 80
LDI r2, 50
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
