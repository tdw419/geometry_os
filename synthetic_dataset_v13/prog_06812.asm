; DESCRIPTION: Places a black 47x22 rectangle at position (308, 150).
; PLAN: r0=308(x), r1=150(y), r2=47(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 150
LDI r2, 47
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
