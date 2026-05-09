; DESCRIPTION: Renders a black box of size 62x116 starting at (445, 79).
; PLAN: r0=445(x), r1=79(y), r2=62(width), r3=116(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 79
LDI r2, 62
LDI r3, 116
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
