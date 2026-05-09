; DESCRIPTION: Places a magenta 75x27 rectangle at position (79, 130).
; PLAN: r0=79(x), r1=130(y), r2=75(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 130
LDI r2, 75
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
