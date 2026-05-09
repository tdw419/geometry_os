; DESCRIPTION: Renders a green box of size 115x60 starting at (173, 78).
; PLAN: r0=173(x), r1=78(y), r2=115(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 78
LDI r2, 115
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
