; DESCRIPTION: Places a magenta 72x63 rectangle at position (401, 120).
; PLAN: r0=401(x), r1=120(y), r2=72(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 120
LDI r2, 72
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
