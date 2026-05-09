; DESCRIPTION: Places a magenta 14x87 rectangle at position (228, 20).
; PLAN: r0=228(x), r1=20(y), r2=14(width), r3=87(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 20
LDI r2, 14
LDI r3, 87
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
