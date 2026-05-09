; DESCRIPTION: Renders a green box of size 40x38 starting at (331, 24).
; PLAN: r0=331(x), r1=24(y), r2=40(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 24
LDI r2, 40
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
