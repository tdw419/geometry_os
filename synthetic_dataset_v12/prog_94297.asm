; DESCRIPTION: Places a magenta 103x112 rectangle at position (387, 47).
; PLAN: r0=387(x), r1=47(y), r2=103(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 47
LDI r2, 103
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
