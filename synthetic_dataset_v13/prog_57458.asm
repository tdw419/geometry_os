; DESCRIPTION: Renders a green box of size 12x117 starting at (272, 48).
; PLAN: r0=272(x), r1=48(y), r2=12(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 48
LDI r2, 12
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
