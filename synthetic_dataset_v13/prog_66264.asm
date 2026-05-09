; DESCRIPTION: Renders a purple box of size 108x18 starting at (327, 186).
; PLAN: r0=327(x), r1=186(y), r2=108(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 186
LDI r2, 108
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
