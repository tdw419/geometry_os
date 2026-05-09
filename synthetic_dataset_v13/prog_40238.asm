; DESCRIPTION: Places a red 81x57 rectangle at position (317, 65).
; PLAN: r0=317(x), r1=65(y), r2=81(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 65
LDI r2, 81
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
