; DESCRIPTION: Renders a green box of size 110x80 starting at (42, 27).
; PLAN: r0=42(x), r1=27(y), r2=110(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 27
LDI r2, 110
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
