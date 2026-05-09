; DESCRIPTION: Places a red 29x14 rectangle at position (449, 152).
; PLAN: r0=449(x), r1=152(y), r2=29(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 152
LDI r2, 29
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
