; DESCRIPTION: Places a magenta 45x38 rectangle at position (195, 38).
; PLAN: r0=195(x), r1=38(y), r2=45(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 38
LDI r2, 45
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
