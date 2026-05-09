; DESCRIPTION: Places a magenta 16x70 rectangle at position (83, 40).
; PLAN: r0=83(x), r1=40(y), r2=16(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 40
LDI r2, 16
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
