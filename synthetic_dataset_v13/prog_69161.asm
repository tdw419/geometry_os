; DESCRIPTION: Places a red 92x66 rectangle at position (38, 145).
; PLAN: r0=38(x), r1=145(y), r2=92(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 145
LDI r2, 92
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
