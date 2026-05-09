; DESCRIPTION: Renders a blue box of size 21x103 starting at (349, 77).
; PLAN: r0=349(x), r1=77(y), r2=21(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 77
LDI r2, 21
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
