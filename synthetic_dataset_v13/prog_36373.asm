; DESCRIPTION: Places a magenta 105x25 rectangle at position (229, 173).
; PLAN: r0=229(x), r1=173(y), r2=105(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 173
LDI r2, 105
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
