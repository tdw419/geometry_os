; DESCRIPTION: Places a red 96x79 rectangle at position (292, 2).
; PLAN: r0=292(x), r1=2(y), r2=96(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 2
LDI r2, 96
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
