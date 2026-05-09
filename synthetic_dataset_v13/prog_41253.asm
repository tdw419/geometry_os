; DESCRIPTION: Places a red 85x37 rectangle at position (81, 152).
; PLAN: r0=81(x), r1=152(y), r2=85(width), r3=37(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 152
LDI r2, 85
LDI r3, 37
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
