; DESCRIPTION: Places a red 37x92 rectangle at position (428, 29).
; PLAN: r0=428(x), r1=29(y), r2=37(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 29
LDI r2, 37
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
