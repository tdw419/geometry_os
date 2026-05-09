; DESCRIPTION: Renders a green box of size 37x69 starting at (10, 126).
; PLAN: r0=10(x), r1=126(y), r2=37(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 126
LDI r2, 37
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
