; DESCRIPTION: Places a yellow 69x70 rectangle at position (418, 106).
; PLAN: r0=418(x), r1=106(y), r2=69(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 106
LDI r2, 69
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
