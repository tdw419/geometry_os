; DESCRIPTION: Places a white 13x112 rectangle at position (449, 108).
; PLAN: r0=449(x), r1=108(y), r2=13(width), r3=112(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 108
LDI r2, 13
LDI r3, 112
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
