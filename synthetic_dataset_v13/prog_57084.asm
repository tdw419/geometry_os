; DESCRIPTION: Places a magenta 72x62 rectangle at position (182, 27).
; PLAN: r0=182(x), r1=27(y), r2=72(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 27
LDI r2, 72
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
