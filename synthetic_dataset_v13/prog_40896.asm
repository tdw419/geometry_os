; DESCRIPTION: Renders a black box of size 34x23 starting at (27, 132).
; PLAN: r0=27(x), r1=132(y), r2=34(width), r3=23(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 132
LDI r2, 34
LDI r3, 23
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
