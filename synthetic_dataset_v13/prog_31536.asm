; DESCRIPTION: Places a red 120x23 rectangle at position (317, 167).
; PLAN: r0=317(x), r1=167(y), r2=120(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 167
LDI r2, 120
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
