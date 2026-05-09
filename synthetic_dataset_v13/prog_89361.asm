; DESCRIPTION: Renders a green box of size 10x24 starting at (330, 218).
; PLAN: r0=330(x), r1=218(y), r2=10(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 218
LDI r2, 10
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
