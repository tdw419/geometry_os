; DESCRIPTION: Places a magenta 37x90 rectangle at position (435, 14).
; PLAN: r0=435(x), r1=14(y), r2=37(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 14
LDI r2, 37
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
