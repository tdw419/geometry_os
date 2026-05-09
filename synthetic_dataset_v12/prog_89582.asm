; DESCRIPTION: Renders a green box of size 45x25 starting at (125, 108).
; PLAN: r0=125(x), r1=108(y), r2=45(width), r3=25(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 108
LDI r2, 45
LDI r3, 25
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
