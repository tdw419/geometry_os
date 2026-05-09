; DESCRIPTION: Renders a green box of size 13x18 starting at (12, 204).
; PLAN: r0=12(x), r1=204(y), r2=13(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 204
LDI r2, 13
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
