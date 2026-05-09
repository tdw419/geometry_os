; DESCRIPTION: Places a purple 109x50 rectangle at position (357, 199).
; PLAN: r0=357(x), r1=199(y), r2=109(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 199
LDI r2, 109
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
