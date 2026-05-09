; DESCRIPTION: Places a white 90x108 rectangle at position (2, 52).
; PLAN: r0=2(x), r1=52(y), r2=90(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 52
LDI r2, 90
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
