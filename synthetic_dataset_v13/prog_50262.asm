; DESCRIPTION: Places a yellow 69x112 rectangle at position (79, 23).
; PLAN: r0=79(x), r1=23(y), r2=69(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 23
LDI r2, 69
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
