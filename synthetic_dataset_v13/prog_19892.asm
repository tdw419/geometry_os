; DESCRIPTION: Renders a green box of size 62x55 starting at (340, 37).
; PLAN: r0=340(x), r1=37(y), r2=62(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 37
LDI r2, 62
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
