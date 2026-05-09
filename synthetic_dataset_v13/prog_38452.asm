; DESCRIPTION: Places a orange 48x108 rectangle at position (153, 102).
; PLAN: r0=153(x), r1=102(y), r2=48(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 102
LDI r2, 48
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
