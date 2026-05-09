; DESCRIPTION: Renders a black box of size 97x12 starting at (302, 143).
; PLAN: r0=302(x), r1=143(y), r2=97(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 143
LDI r2, 97
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
