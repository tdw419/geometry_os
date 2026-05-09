; DESCRIPTION: Renders a green box of size 16x20 starting at (44, 24).
; PLAN: r0=44(x), r1=24(y), r2=16(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 24
LDI r2, 16
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
