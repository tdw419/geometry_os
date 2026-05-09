; DESCRIPTION: Renders a black box of size 28x112 starting at (295, 25).
; PLAN: r0=295(x), r1=25(y), r2=28(width), r3=112(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 25
LDI r2, 28
LDI r3, 112
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
