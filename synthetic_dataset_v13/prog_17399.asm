; DESCRIPTION: Places a black 54x43 rectangle at position (429, 80).
; PLAN: r0=429(x), r1=80(y), r2=54(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 80
LDI r2, 54
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
