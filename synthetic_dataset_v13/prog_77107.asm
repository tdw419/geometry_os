; DESCRIPTION: Creates a green rectangular region at (6, 25) spanning 120 by 24 pixels.
; PLAN: r0=6(x), r1=25(y), r2=120(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 25
LDI r2, 120
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
