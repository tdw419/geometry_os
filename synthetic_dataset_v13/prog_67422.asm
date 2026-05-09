; DESCRIPTION: Places a green 13x79 rectangle at position (308, 153).
; PLAN: r0=308(x), r1=153(y), r2=13(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 153
LDI r2, 13
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
