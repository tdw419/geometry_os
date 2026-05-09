; DESCRIPTION: Renders a green box of size 108x60 starting at (304, 122).
; PLAN: r0=304(x), r1=122(y), r2=108(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 122
LDI r2, 108
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
