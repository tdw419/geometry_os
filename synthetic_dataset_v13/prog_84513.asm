; DESCRIPTION: Places a blue 61x50 rectangle at position (55, 126).
; PLAN: r0=55(x), r1=126(y), r2=61(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 126
LDI r2, 61
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
