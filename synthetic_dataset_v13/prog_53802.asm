; DESCRIPTION: Places a red 92x56 rectangle at position (127, 165).
; PLAN: r0=127(x), r1=165(y), r2=92(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 165
LDI r2, 92
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
