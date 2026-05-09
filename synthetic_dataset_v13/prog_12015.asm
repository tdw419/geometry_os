; DESCRIPTION: Renders a red box of size 28x105 starting at (52, 132).
; PLAN: r0=52(x), r1=132(y), r2=28(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 132
LDI r2, 28
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
