; DESCRIPTION: Places a magenta 102x27 rectangle at position (211, 80).
; PLAN: r0=211(x), r1=80(y), r2=102(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 80
LDI r2, 102
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
