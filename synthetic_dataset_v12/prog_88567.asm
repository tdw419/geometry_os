; DESCRIPTION: Renders a blue box of size 30x35 starting at (151, 213).
; PLAN: r0=151(x), r1=213(y), r2=30(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 213
LDI r2, 30
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
