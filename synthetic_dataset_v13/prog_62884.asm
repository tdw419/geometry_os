; DESCRIPTION: Renders a magenta box of size 59x82 starting at (83, 103).
; PLAN: r0=83(x), r1=103(y), r2=59(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 103
LDI r2, 59
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
