; DESCRIPTION: Renders a purple box of size 54x46 starting at (320, 100).
; PLAN: r0=320(x), r1=100(y), r2=54(width), r3=46(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 100
LDI r2, 54
LDI r3, 46
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
