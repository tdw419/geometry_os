; DESCRIPTION: Renders a black box of size 99x79 starting at (374, 156).
; PLAN: r0=374(x), r1=156(y), r2=99(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 156
LDI r2, 99
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
