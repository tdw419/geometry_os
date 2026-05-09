; DESCRIPTION: Places a magenta 99x102 rectangle at position (150, 109).
; PLAN: r0=150(x), r1=109(y), r2=99(width), r3=102(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 109
LDI r2, 99
LDI r3, 102
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
