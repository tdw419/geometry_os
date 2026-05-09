; DESCRIPTION: Places a red 60x92 rectangle at position (174, 0).
; PLAN: r0=174(x), r1=0(y), r2=60(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 0
LDI r2, 60
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
