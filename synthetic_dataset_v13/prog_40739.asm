; DESCRIPTION: Places a green 87x120 rectangle at position (336, 75).
; PLAN: r0=336(x), r1=75(y), r2=87(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 75
LDI r2, 87
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
