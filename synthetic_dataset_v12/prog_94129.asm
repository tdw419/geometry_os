; DESCRIPTION: Places a white 58x98 rectangle at position (193, 62).
; PLAN: r0=193(x), r1=62(y), r2=58(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 62
LDI r2, 58
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
