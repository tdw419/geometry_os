; DESCRIPTION: Places a magenta 86x18 rectangle at position (401, 115).
; PLAN: r0=401(x), r1=115(y), r2=86(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 115
LDI r2, 86
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
