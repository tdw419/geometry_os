; DESCRIPTION: Renders a green box of size 72x62 starting at (306, 96).
; PLAN: r0=306(x), r1=96(y), r2=72(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 96
LDI r2, 72
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
