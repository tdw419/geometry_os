; DESCRIPTION: Places a red 79x22 rectangle at position (73, 130).
; PLAN: r0=73(x), r1=130(y), r2=79(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 130
LDI r2, 79
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
