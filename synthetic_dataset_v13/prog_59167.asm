; DESCRIPTION: Places a yellow 95x69 rectangle at position (188, 127).
; PLAN: r0=188(x), r1=127(y), r2=95(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 127
LDI r2, 95
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
