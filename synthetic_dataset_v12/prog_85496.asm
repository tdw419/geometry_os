; DESCRIPTION: Places a red 74x73 rectangle at position (79, 48).
; PLAN: r0=79(x), r1=48(y), r2=74(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 48
LDI r2, 74
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
