; DESCRIPTION: Places a yellow 87x15 rectangle at position (258, 95).
; PLAN: r0=258(x), r1=95(y), r2=87(width), r3=15(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 95
LDI r2, 87
LDI r3, 15
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
