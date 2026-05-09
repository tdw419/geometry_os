; DESCRIPTION: Places a magenta 106x105 rectangle at position (25, 54).
; PLAN: r0=25(x), r1=54(y), r2=106(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 54
LDI r2, 106
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
