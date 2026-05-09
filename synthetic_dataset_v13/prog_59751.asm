; DESCRIPTION: Renders a black box of size 39x91 starting at (468, 13).
; PLAN: r0=468(x), r1=13(y), r2=39(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 13
LDI r2, 39
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
