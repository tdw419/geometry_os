; DESCRIPTION: Places a red 79x71 rectangle at position (325, 31).
; PLAN: r0=325(x), r1=31(y), r2=79(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 31
LDI r2, 79
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
