; DESCRIPTION: Places a magenta 93x87 rectangle at position (243, 35).
; PLAN: r0=243(x), r1=35(y), r2=93(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 35
LDI r2, 93
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
