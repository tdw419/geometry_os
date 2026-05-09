; DESCRIPTION: Renders a blue box of size 75x30 starting at (426, 213).
; PLAN: r0=426(x), r1=213(y), r2=75(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 213
LDI r2, 75
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
