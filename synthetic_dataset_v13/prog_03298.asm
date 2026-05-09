; DESCRIPTION: Renders a green box of size 18x87 starting at (0, 96).
; PLAN: r0=0(x), r1=96(y), r2=18(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 96
LDI r2, 18
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
