; DESCRIPTION: Places a purple 87x85 rectangle at position (403, 95).
; PLAN: r0=403(x), r1=95(y), r2=87(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 95
LDI r2, 87
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
