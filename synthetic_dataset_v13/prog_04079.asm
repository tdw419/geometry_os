; DESCRIPTION: Places a purple 87x52 rectangle at position (352, 75).
; PLAN: r0=352(x), r1=75(y), r2=87(width), r3=52(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 75
LDI r2, 87
LDI r3, 52
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
