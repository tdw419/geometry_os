; DESCRIPTION: Renders a green box of size 110x28 starting at (365, 191).
; PLAN: r0=365(x), r1=191(y), r2=110(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 191
LDI r2, 110
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
