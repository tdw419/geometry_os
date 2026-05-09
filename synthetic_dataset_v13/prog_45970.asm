; DESCRIPTION: Renders a green box of size 111x46 starting at (45, 84).
; PLAN: r0=45(x), r1=84(y), r2=111(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 84
LDI r2, 111
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
