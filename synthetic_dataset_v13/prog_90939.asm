; DESCRIPTION: Places a red 96x22 rectangle at position (75, 47).
; PLAN: r0=75(x), r1=47(y), r2=96(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 47
LDI r2, 96
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
