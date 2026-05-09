; DESCRIPTION: Renders a blue box of size 98x39 starting at (320, 149).
; PLAN: r0=320(x), r1=149(y), r2=98(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 149
LDI r2, 98
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
