; DESCRIPTION: Renders a green box of size 49x72 starting at (365, 26).
; PLAN: r0=365(x), r1=26(y), r2=49(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 26
LDI r2, 49
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
