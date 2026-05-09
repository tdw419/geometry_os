; DESCRIPTION: Renders a green box of size 75x54 starting at (151, 5).
; PLAN: r0=151(x), r1=5(y), r2=75(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 5
LDI r2, 75
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
