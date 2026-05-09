; DESCRIPTION: Places a black 101x111 rectangle at position (400, 72).
; PLAN: r0=400(x), r1=72(y), r2=101(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 72
LDI r2, 101
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
