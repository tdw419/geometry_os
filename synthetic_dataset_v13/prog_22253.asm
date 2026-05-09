; DESCRIPTION: Places a green 45x45 rectangle at position (407, 168).
; PLAN: r0=407(x), r1=168(y), r2=45(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 168
LDI r2, 45
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
