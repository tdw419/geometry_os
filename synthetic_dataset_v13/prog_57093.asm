; DESCRIPTION: Renders a green box of size 62x21 starting at (113, 45).
; PLAN: r0=113(x), r1=45(y), r2=62(width), r3=21(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 45
LDI r2, 62
LDI r3, 21
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
