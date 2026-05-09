; DESCRIPTION: Renders a green box of size 95x81 starting at (385, 19).
; PLAN: r0=385(x), r1=19(y), r2=95(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 19
LDI r2, 95
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
