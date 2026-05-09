; DESCRIPTION: Renders a yellow box of size 13x25 starting at (283, 150).
; PLAN: r0=283(x), r1=150(y), r2=13(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 150
LDI r2, 13
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
