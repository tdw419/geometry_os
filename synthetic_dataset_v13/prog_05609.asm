; DESCRIPTION: Places a magenta 11x100 rectangle at position (387, 107).
; PLAN: r0=387(x), r1=107(y), r2=11(width), r3=100(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 107
LDI r2, 11
LDI r3, 100
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
