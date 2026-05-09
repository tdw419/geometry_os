; DESCRIPTION: Renders a green box of size 82x88 starting at (65, 21).
; PLAN: r0=65(x), r1=21(y), r2=82(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 21
LDI r2, 82
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
