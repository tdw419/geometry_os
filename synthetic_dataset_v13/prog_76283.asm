; DESCRIPTION: Places a red 92x22 rectangle at position (147, 180).
; PLAN: r0=147(x), r1=180(y), r2=92(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 180
LDI r2, 92
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
