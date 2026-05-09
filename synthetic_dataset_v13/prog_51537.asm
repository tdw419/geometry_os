; DESCRIPTION: Renders a black box of size 57x27 starting at (28, 172).
; PLAN: r0=28(x), r1=172(y), r2=57(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 172
LDI r2, 57
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
