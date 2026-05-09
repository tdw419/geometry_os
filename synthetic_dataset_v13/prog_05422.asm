; DESCRIPTION: Places a red 85x91 rectangle at position (83, 148).
; PLAN: r0=83(x), r1=148(y), r2=85(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 148
LDI r2, 85
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
