; DESCRIPTION: Places a red 33x92 rectangle at position (317, 99).
; PLAN: r0=317(x), r1=99(y), r2=33(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 99
LDI r2, 33
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
