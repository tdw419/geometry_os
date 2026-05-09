; DESCRIPTION: Places a orange 98x115 rectangle at position (273, 59).
; PLAN: r0=273(x), r1=59(y), r2=98(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 59
LDI r2, 98
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
