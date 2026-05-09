; DESCRIPTION: Places a magenta 23x61 rectangle at position (422, 189).
; PLAN: r0=422(x), r1=189(y), r2=23(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 189
LDI r2, 23
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
