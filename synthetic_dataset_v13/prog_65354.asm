; DESCRIPTION: Places a orange 79x98 rectangle at position (273, 83).
; PLAN: r0=273(x), r1=83(y), r2=79(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 83
LDI r2, 79
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
