; DESCRIPTION: Renders a green box of size 104x63 starting at (270, 0).
; PLAN: r0=270(x), r1=0(y), r2=104(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 0
LDI r2, 104
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
