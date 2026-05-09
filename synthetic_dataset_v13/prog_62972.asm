; DESCRIPTION: Renders a green box of size 95x87 starting at (45, 4).
; PLAN: r0=45(x), r1=4(y), r2=95(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 4
LDI r2, 95
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
