; DESCRIPTION: Places a green 74x79 rectangle at position (169, 29).
; PLAN: r0=169(x), r1=29(y), r2=74(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 29
LDI r2, 74
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
