; DESCRIPTION: Places a red 31x29 rectangle at position (317, 56).
; PLAN: r0=317(x), r1=56(y), r2=31(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 56
LDI r2, 31
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
