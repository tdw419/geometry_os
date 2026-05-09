; DESCRIPTION: Places a yellow 113x22 rectangle at position (134, 152).
; PLAN: r0=134(x), r1=152(y), r2=113(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 152
LDI r2, 113
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
