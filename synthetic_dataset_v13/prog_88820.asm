; DESCRIPTION: Places a magenta 97x45 rectangle at position (130, 208).
; PLAN: r0=130(x), r1=208(y), r2=97(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 208
LDI r2, 97
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
