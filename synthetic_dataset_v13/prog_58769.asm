; DESCRIPTION: Renders a yellow box of size 67x111 starting at (231, 79).
; PLAN: r0=231(x), r1=79(y), r2=67(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 79
LDI r2, 67
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
