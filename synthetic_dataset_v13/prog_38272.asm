; DESCRIPTION: Places a cyan 13x72 rectangle at position (308, 148).
; PLAN: r0=308(x), r1=148(y), r2=13(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 148
LDI r2, 13
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
