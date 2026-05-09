; DESCRIPTION: Renders a yellow box of size 37x15 starting at (164, 203).
; PLAN: r0=164(x), r1=203(y), r2=37(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 203
LDI r2, 37
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
