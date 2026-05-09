; DESCRIPTION: Renders a green box of size 83x21 starting at (360, 72).
; PLAN: r0=360(x), r1=72(y), r2=83(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 72
LDI r2, 83
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
