; DESCRIPTION: Places a white 70x63 rectangle at position (69, 89).
; PLAN: r0=69(x), r1=89(y), r2=70(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 89
LDI r2, 70
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
