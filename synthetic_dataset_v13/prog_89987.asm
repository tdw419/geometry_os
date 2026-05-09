; DESCRIPTION: Places a magenta 13x16 rectangle at position (273, 55).
; PLAN: r0=273(x), r1=55(y), r2=13(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 55
LDI r2, 13
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
