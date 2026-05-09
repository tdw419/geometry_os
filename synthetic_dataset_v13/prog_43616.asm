; DESCRIPTION: Renders a green box of size 83x78 starting at (360, 154).
; PLAN: r0=360(x), r1=154(y), r2=83(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 154
LDI r2, 83
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
