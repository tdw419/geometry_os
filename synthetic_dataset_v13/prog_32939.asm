; DESCRIPTION: Places a magenta 109x101 rectangle at position (290, 143).
; PLAN: r0=290(x), r1=143(y), r2=109(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 143
LDI r2, 109
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
