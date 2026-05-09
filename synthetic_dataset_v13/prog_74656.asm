; DESCRIPTION: Places a magenta 92x41 rectangle at position (317, 152).
; PLAN: r0=317(x), r1=152(y), r2=92(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 152
LDI r2, 92
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
