; DESCRIPTION: Renders a black box of size 22x99 starting at (331, 27).
; PLAN: r0=331(x), r1=27(y), r2=22(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 27
LDI r2, 22
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
