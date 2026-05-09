; DESCRIPTION: Places a magenta 12x27 rectangle at position (23, 191).
; PLAN: r0=23(x), r1=191(y), r2=12(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 191
LDI r2, 12
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
