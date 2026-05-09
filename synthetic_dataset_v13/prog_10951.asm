; DESCRIPTION: Places a red 58x47 rectangle at position (317, 145).
; PLAN: r0=317(x), r1=145(y), r2=58(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 145
LDI r2, 58
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
