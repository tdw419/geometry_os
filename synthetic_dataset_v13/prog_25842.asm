; DESCRIPTION: Renders a green box of size 14x48 starting at (426, 172).
; PLAN: r0=426(x), r1=172(y), r2=14(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 172
LDI r2, 14
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
