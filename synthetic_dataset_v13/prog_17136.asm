; DESCRIPTION: Places a magenta 120x82 rectangle at position (251, 56).
; PLAN: r0=251(x), r1=56(y), r2=120(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 56
LDI r2, 120
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
