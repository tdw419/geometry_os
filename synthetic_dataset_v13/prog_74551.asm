; DESCRIPTION: Renders a green box of size 18x83 starting at (116, 9).
; PLAN: r0=116(x), r1=9(y), r2=18(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 9
LDI r2, 18
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
