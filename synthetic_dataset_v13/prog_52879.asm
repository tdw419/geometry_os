; DESCRIPTION: Renders a white box of size 13x63 starting at (261, 150).
; PLAN: r0=261(x), r1=150(y), r2=13(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 150
LDI r2, 13
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
