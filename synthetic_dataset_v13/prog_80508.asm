; DESCRIPTION: Renders a black box of size 65x26 starting at (193, 85).
; PLAN: r0=193(x), r1=85(y), r2=65(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 85
LDI r2, 65
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
