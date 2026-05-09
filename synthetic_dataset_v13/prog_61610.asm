; DESCRIPTION: Places a yellow 116x79 rectangle at position (314, 125).
; PLAN: r0=314(x), r1=125(y), r2=116(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 125
LDI r2, 116
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
