; DESCRIPTION: Places a white 92x101 rectangle at position (65, 79).
; PLAN: r0=65(x), r1=79(y), r2=92(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 79
LDI r2, 92
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
