; DESCRIPTION: Places a magenta 106x105 rectangle at position (236, 68).
; PLAN: r0=236(x), r1=68(y), r2=106(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 68
LDI r2, 106
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
