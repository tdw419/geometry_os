; DESCRIPTION: Places a orange 70x106 rectangle at position (180, 75).
; PLAN: r0=180(x), r1=75(y), r2=70(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 75
LDI r2, 70
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
