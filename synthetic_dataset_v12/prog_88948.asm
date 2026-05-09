; DESCRIPTION: Renders a green box of size 15x45 starting at (253, 45).
; PLAN: r0=253(x), r1=45(y), r2=15(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 45
LDI r2, 15
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
