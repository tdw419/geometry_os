; DESCRIPTION: Places a magenta 66x65 rectangle at position (358, 75).
; PLAN: r0=358(x), r1=75(y), r2=66(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 75
LDI r2, 66
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
