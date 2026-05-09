; DESCRIPTION: Places a green 45x85 rectangle at position (150, 124).
; PLAN: r0=150(x), r1=124(y), r2=45(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 124
LDI r2, 45
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
