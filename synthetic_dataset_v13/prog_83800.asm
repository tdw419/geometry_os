; DESCRIPTION: Places a red 86x22 rectangle at position (308, 35).
; PLAN: r0=308(x), r1=35(y), r2=86(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 35
LDI r2, 86
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
