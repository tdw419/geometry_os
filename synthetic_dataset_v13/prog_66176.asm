; DESCRIPTION: Renders a purple box of size 108x58 starting at (43, 174).
; PLAN: r0=43(x), r1=174(y), r2=108(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 174
LDI r2, 108
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
