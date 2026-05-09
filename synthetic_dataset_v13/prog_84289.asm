; DESCRIPTION: Renders a green box of size 35x25 starting at (128, 27).
; PLAN: r0=128(x), r1=27(y), r2=35(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 27
LDI r2, 35
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
