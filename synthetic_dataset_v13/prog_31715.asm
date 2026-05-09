; DESCRIPTION: Places a magenta 37x87 rectangle at position (395, 96).
; PLAN: r0=395(x), r1=96(y), r2=37(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 96
LDI r2, 37
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
