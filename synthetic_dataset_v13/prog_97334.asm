; DESCRIPTION: Places a magenta 10x27 rectangle at position (36, 55).
; PLAN: r0=36(x), r1=55(y), r2=10(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 55
LDI r2, 10
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
