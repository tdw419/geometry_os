; DESCRIPTION: Renders a purple box of size 59x43 starting at (186, 197).
; PLAN: r0=186(x), r1=197(y), r2=59(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 197
LDI r2, 59
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
