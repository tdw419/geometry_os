; DESCRIPTION: Places a magenta 52x31 rectangle at position (40, 124).
; PLAN: r0=40(x), r1=124(y), r2=52(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 124
LDI r2, 52
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
