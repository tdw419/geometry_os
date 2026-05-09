; DESCRIPTION: Creates a magenta rectangular region at (277, 36) spanning 94 by 108 pixels.
; PLAN: r0=277(x), r1=36(y), r2=94(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 36
LDI r2, 94
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
