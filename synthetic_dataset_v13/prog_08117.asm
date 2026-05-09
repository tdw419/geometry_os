; DESCRIPTION: Places a magenta 52x21 rectangle at position (25, 229).
; PLAN: r0=25(x), r1=229(y), r2=52(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 229
LDI r2, 52
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
