; DESCRIPTION: Places a red 109x79 rectangle at position (238, 127).
; PLAN: r0=238(x), r1=127(y), r2=109(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 127
LDI r2, 109
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
