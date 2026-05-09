; DESCRIPTION: Places a green 85x45 rectangle at position (83, 181).
; PLAN: r0=83(x), r1=181(y), r2=85(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 181
LDI r2, 85
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
