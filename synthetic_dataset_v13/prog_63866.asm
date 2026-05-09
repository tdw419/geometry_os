; DESCRIPTION: Renders a green box of size 93x117 starting at (83, 126).
; PLAN: r0=83(x), r1=126(y), r2=93(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 126
LDI r2, 93
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
