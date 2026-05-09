; DESCRIPTION: Places a red 108x116 rectangle at position (301, 63).
; PLAN: r0=301(x), r1=63(y), r2=108(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 63
LDI r2, 108
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
