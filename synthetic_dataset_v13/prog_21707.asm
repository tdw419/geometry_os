; DESCRIPTION: Renders a green box of size 19x95 starting at (413, 17).
; PLAN: r0=413(x), r1=17(y), r2=19(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 17
LDI r2, 19
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
