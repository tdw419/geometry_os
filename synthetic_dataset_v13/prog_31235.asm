; DESCRIPTION: Renders a yellow box of size 78x61 starting at (166, 26).
; PLAN: r0=166(x), r1=26(y), r2=78(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 26
LDI r2, 78
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
