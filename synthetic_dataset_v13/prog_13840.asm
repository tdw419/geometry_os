; DESCRIPTION: Places a red 112x91 rectangle at position (377, 131).
; PLAN: r0=377(x), r1=131(y), r2=112(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 131
LDI r2, 112
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
