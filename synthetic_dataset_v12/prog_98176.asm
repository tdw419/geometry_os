; DESCRIPTION: Places a magenta 16x15 rectangle at position (149, 27).
; PLAN: r0=149(x), r1=27(y), r2=16(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 27
LDI r2, 16
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
