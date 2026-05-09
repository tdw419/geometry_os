; DESCRIPTION: Places a magenta 27x78 rectangle at position (401, 172).
; PLAN: r0=401(x), r1=172(y), r2=27(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 172
LDI r2, 27
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
