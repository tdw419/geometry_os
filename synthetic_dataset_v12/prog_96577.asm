; DESCRIPTION: Places a orange 108x93 rectangle at position (330, 92).
; PLAN: r0=330(x), r1=92(y), r2=108(width), r3=93(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 92
LDI r2, 108
LDI r3, 93
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
