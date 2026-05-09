; DESCRIPTION: Renders a green box of size 66x46 starting at (376, 6).
; PLAN: r0=376(x), r1=6(y), r2=66(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 6
LDI r2, 66
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
