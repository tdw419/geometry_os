; DESCRIPTION: Renders a yellow box of size 25x15 starting at (317, 67).
; PLAN: r0=317(x), r1=67(y), r2=25(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 67
LDI r2, 25
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
