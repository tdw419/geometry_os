; DESCRIPTION: Renders a green box of size 75x88 starting at (403, 106).
; PLAN: r0=403(x), r1=106(y), r2=75(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 106
LDI r2, 75
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
