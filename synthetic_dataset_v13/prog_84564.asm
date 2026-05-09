; DESCRIPTION: Renders a magenta box of size 13x103 starting at (376, 35).
; PLAN: r0=376(x), r1=35(y), r2=13(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 35
LDI r2, 13
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
