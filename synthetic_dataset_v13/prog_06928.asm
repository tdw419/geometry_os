; DESCRIPTION: Places a yellow 69x83 rectangle at position (305, 158).
; PLAN: r0=305(x), r1=158(y), r2=69(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 158
LDI r2, 69
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
