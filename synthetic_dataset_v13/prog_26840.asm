; DESCRIPTION: Places a blue 41x111 rectangle at position (429, 17).
; PLAN: r0=429(x), r1=17(y), r2=41(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 17
LDI r2, 41
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
