; DESCRIPTION: Places a yellow 58x20 rectangle at position (405, 87).
; PLAN: r0=405(x), r1=87(y), r2=58(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 87
LDI r2, 58
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
