; DESCRIPTION: Places a magenta 96x19 rectangle at position (401, 136).
; PLAN: r0=401(x), r1=136(y), r2=96(width), r3=19(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 136
LDI r2, 96
LDI r3, 19
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
