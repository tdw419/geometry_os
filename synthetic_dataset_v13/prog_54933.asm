; DESCRIPTION: Places a green 45x118 rectangle at position (210, 48).
; PLAN: r0=210(x), r1=48(y), r2=45(width), r3=118(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 48
LDI r2, 45
LDI r3, 118
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
