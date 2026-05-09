; DESCRIPTION: Places a magenta 74x87 rectangle at position (290, 34).
; PLAN: r0=290(x), r1=34(y), r2=74(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 34
LDI r2, 74
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
