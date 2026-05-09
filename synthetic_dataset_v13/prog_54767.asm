; DESCRIPTION: Places a green 40x89 rectangle at position (79, 73).
; PLAN: r0=79(x), r1=73(y), r2=40(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 73
LDI r2, 40
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
