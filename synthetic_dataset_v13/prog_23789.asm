; DESCRIPTION: Places a green 61x58 rectangle at position (200, 142).
; PLAN: r0=200(x), r1=142(y), r2=61(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 142
LDI r2, 61
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
