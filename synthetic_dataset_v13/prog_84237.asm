; DESCRIPTION: Places a yellow 15x20 rectangle at position (450, 61).
; PLAN: r0=450(x), r1=61(y), r2=15(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 61
LDI r2, 15
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
