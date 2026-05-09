; DESCRIPTION: Renders a black box of size 28x20 starting at (151, 213).
; PLAN: r0=151(x), r1=213(y), r2=28(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 213
LDI r2, 28
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
