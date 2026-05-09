; DESCRIPTION: Places a yellow 108x60 rectangle at position (68, 34).
; PLAN: r0=68(x), r1=34(y), r2=108(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 34
LDI r2, 108
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
