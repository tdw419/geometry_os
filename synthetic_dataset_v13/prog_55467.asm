; DESCRIPTION: Places a magenta 76x50 rectangle at position (285, 71).
; PLAN: r0=285(x), r1=71(y), r2=76(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 71
LDI r2, 76
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
