; DESCRIPTION: Renders a green box of size 116x23 starting at (13, 190).
; PLAN: r0=13(x), r1=190(y), r2=116(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 190
LDI r2, 116
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
