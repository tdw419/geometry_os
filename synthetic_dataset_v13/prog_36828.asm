; DESCRIPTION: Places a yellow 75x102 rectangle at position (149, 103).
; PLAN: r0=149(x), r1=103(y), r2=75(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 103
LDI r2, 75
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
