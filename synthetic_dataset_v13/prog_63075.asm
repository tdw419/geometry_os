; DESCRIPTION: Places a green 117x92 rectangle at position (371, 141).
; PLAN: r0=371(x), r1=141(y), r2=117(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 141
LDI r2, 117
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
