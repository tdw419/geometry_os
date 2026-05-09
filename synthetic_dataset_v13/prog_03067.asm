; DESCRIPTION: Places a green 109x30 rectangle at position (400, 115).
; PLAN: r0=400(x), r1=115(y), r2=109(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 115
LDI r2, 109
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
