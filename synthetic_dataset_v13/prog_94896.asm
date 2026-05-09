; DESCRIPTION: Renders a green box of size 34x24 starting at (347, 60).
; PLAN: r0=347(x), r1=60(y), r2=34(width), r3=24(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 60
LDI r2, 34
LDI r3, 24
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
