; DESCRIPTION: Places a green 72x16 rectangle at position (308, 141).
; PLAN: r0=308(x), r1=141(y), r2=72(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 141
LDI r2, 72
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
