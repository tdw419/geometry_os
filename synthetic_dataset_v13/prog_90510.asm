; DESCRIPTION: Renders a black box of size 79x46 starting at (174, 39).
; PLAN: r0=174(x), r1=39(y), r2=79(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 39
LDI r2, 79
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
