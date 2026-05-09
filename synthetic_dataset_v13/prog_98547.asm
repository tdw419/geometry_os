; DESCRIPTION: Renders a black box of size 11x48 starting at (25, 113).
; PLAN: r0=25(x), r1=113(y), r2=11(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 113
LDI r2, 11
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
