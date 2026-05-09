; DESCRIPTION: Places a magenta 102x92 rectangle at position (117, 143).
; PLAN: r0=117(x), r1=143(y), r2=102(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 143
LDI r2, 102
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
