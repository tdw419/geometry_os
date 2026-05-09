; DESCRIPTION: Renders a green box of size 20x109 starting at (90, 39).
; PLAN: r0=90(x), r1=39(y), r2=20(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 39
LDI r2, 20
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
