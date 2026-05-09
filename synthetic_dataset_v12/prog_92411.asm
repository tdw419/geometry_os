; DESCRIPTION: Renders a green box of size 119x80 starting at (21, 83).
; PLAN: r0=21(x), r1=83(y), r2=119(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 83
LDI r2, 119
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
