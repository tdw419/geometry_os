; DESCRIPTION: Renders a yellow box of size 95x25 starting at (352, 217).
; PLAN: r0=352(x), r1=217(y), r2=95(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 217
LDI r2, 95
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
