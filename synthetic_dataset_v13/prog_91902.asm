; DESCRIPTION: Places a red 49x57 rectangle at position (433, 108).
; PLAN: r0=433(x), r1=108(y), r2=49(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 108
LDI r2, 49
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
