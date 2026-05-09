; DESCRIPTION: Places a magenta 93x77 rectangle at position (287, 21).
; PLAN: r0=287(x), r1=21(y), r2=93(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 21
LDI r2, 93
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
