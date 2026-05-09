; DESCRIPTION: Creates a magenta rectangular region at (305, 107) spanning 118 by 36 pixels.
; PLAN: r0=305(x), r1=107(y), r2=118(width), r3=36(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 107
LDI r2, 118
LDI r3, 36
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
