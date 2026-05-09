; DESCRIPTION: Places a red 86x58 rectangle at position (321, 191).
; PLAN: r0=321(x), r1=191(y), r2=86(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 191
LDI r2, 86
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
