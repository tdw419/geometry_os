; DESCRIPTION: Renders a green box of size 37x72 starting at (225, 100).
; PLAN: r0=225(x), r1=100(y), r2=37(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 100
LDI r2, 37
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
