; DESCRIPTION: Places a magenta 18x79 rectangle at position (191, 46).
; PLAN: r0=191(x), r1=46(y), r2=18(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 46
LDI r2, 18
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
