; DESCRIPTION: Renders a green box of size 13x48 starting at (189, 12).
; PLAN: r0=189(x), r1=12(y), r2=13(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 12
LDI r2, 13
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
