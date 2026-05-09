; DESCRIPTION: Renders a black box of size 46x27 starting at (356, 160).
; PLAN: r0=356(x), r1=160(y), r2=46(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 160
LDI r2, 46
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
