; DESCRIPTION: Places a orange 111x111 rectangle at position (314, 11).
; PLAN: r0=314(x), r1=11(y), r2=111(width), r3=111(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 11
LDI r2, 111
LDI r3, 111
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
