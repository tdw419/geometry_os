; DESCRIPTION: Renders a purple box of size 108x113 starting at (197, 130).
; PLAN: r0=197(x), r1=130(y), r2=108(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 130
LDI r2, 108
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
