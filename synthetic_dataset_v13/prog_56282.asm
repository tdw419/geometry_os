; DESCRIPTION: Places a green 49x119 rectangle at position (169, 134).
; PLAN: r0=169(x), r1=134(y), r2=49(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 134
LDI r2, 49
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
