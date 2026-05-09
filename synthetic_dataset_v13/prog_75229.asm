; DESCRIPTION: Places a magenta 66x75 rectangle at position (281, 7).
; PLAN: r0=281(x), r1=7(y), r2=66(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 7
LDI r2, 66
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
