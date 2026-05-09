; DESCRIPTION: Renders a white box of size 79x58 starting at (241, 70).
; PLAN: r0=241(x), r1=70(y), r2=79(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 70
LDI r2, 79
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
