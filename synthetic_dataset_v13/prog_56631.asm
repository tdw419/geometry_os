; DESCRIPTION: Places a red 45x49 rectangle at position (321, 5).
; PLAN: r0=321(x), r1=5(y), r2=45(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 5
LDI r2, 45
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
