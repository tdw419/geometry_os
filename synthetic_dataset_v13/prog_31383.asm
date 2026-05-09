; DESCRIPTION: Places a purple 41x111 rectangle at position (385, 9).
; PLAN: r0=385(x), r1=9(y), r2=41(width), r3=111(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 9
LDI r2, 41
LDI r3, 111
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
