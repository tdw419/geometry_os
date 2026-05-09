; DESCRIPTION: Places a orange 82x106 rectangle at position (185, 75).
; PLAN: r0=185(x), r1=75(y), r2=82(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 75
LDI r2, 82
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
