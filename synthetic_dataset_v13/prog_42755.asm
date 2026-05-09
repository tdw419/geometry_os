; DESCRIPTION: Places a yellow 29x113 rectangle at position (79, 23).
; PLAN: r0=79(x), r1=23(y), r2=29(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 23
LDI r2, 29
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
