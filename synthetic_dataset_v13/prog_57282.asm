; DESCRIPTION: Places a magenta 120x27 rectangle at position (1, 109).
; PLAN: r0=1(x), r1=109(y), r2=120(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 109
LDI r2, 120
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
