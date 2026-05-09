; DESCRIPTION: Places a magenta 14x37 rectangle at position (458, 27).
; PLAN: r0=458(x), r1=27(y), r2=14(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 27
LDI r2, 14
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
