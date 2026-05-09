; DESCRIPTION: Places a magenta 91x52 rectangle at position (382, 161).
; PLAN: r0=382(x), r1=161(y), r2=91(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 161
LDI r2, 91
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
