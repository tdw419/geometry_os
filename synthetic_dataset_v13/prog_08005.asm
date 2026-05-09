; DESCRIPTION: Renders a green box of size 12x87 starting at (419, 118).
; PLAN: r0=419(x), r1=118(y), r2=12(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 118
LDI r2, 12
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
