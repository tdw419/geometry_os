; DESCRIPTION: Places a magenta 85x61 rectangle at position (374, 21).
; PLAN: r0=374(x), r1=21(y), r2=85(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 21
LDI r2, 85
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
