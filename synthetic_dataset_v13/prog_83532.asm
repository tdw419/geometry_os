; DESCRIPTION: Places a magenta 24x10 rectangle at position (208, 56).
; PLAN: r0=208(x), r1=56(y), r2=24(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 56
LDI r2, 24
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
