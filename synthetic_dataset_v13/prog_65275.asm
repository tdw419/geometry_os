; DESCRIPTION: Renders a yellow box of size 108x98 starting at (352, 127).
; PLAN: r0=352(x), r1=127(y), r2=108(width), r3=98(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 127
LDI r2, 108
LDI r3, 98
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
