; DESCRIPTION: Renders a blue box of size 13x115 starting at (458, 109).
; PLAN: r0=458(x), r1=109(y), r2=13(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 109
LDI r2, 13
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
