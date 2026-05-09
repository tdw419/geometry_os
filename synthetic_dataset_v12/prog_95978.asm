; DESCRIPTION: Places a blue 46x43 rectangle at position (429, 208).
; PLAN: r0=429(x), r1=208(y), r2=46(width), r3=43(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 208
LDI r2, 46
LDI r3, 43
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
