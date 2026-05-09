; DESCRIPTION: Places a red 87x100 rectangle at position (317, 84).
; PLAN: r0=317(x), r1=84(y), r2=87(width), r3=100(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 84
LDI r2, 87
LDI r3, 100
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
