; DESCRIPTION: Renders a purple box of size 76x48 starting at (270, 93).
; PLAN: r0=270(x), r1=93(y), r2=76(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 93
LDI r2, 76
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
