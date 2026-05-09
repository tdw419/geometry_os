; DESCRIPTION: Places a magenta 37x38 rectangle at position (120, 34).
; PLAN: r0=120(x), r1=34(y), r2=37(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 34
LDI r2, 37
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
