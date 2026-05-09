; DESCRIPTION: Renders a black box of size 48x21 starting at (331, 102).
; PLAN: r0=331(x), r1=102(y), r2=48(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 102
LDI r2, 48
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
