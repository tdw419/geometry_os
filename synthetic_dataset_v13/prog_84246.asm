; DESCRIPTION: Places a magenta 71x63 rectangle at position (327, 117).
; PLAN: r0=327(x), r1=117(y), r2=71(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 117
LDI r2, 71
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
