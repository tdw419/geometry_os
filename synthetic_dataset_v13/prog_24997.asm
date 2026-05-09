; DESCRIPTION: Places a magenta 95x37 rectangle at position (120, 160).
; PLAN: r0=120(x), r1=160(y), r2=95(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 160
LDI r2, 95
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
