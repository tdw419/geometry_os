; DESCRIPTION: Places a magenta 13x61 rectangle at position (405, 62).
; PLAN: r0=405(x), r1=62(y), r2=13(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 62
LDI r2, 13
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
