; DESCRIPTION: Places a magenta 91x106 rectangle at position (228, 33).
; PLAN: r0=228(x), r1=33(y), r2=91(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 33
LDI r2, 91
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
