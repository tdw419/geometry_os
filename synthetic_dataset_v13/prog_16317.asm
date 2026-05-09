; DESCRIPTION: Places a magenta 18x63 rectangle at position (487, 93).
; PLAN: r0=487(x), r1=93(y), r2=18(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 93
LDI r2, 18
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
