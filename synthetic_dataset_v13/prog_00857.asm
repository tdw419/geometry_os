; DESCRIPTION: Places a magenta 79x52 rectangle at position (349, 172).
; PLAN: r0=349(x), r1=172(y), r2=79(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 172
LDI r2, 79
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
