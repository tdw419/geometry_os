; DESCRIPTION: Renders a black box of size 72x37 starting at (37, 65).
; PLAN: r0=37(x), r1=65(y), r2=72(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 65
LDI r2, 72
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
