; DESCRIPTION: Creates a magenta rectangular region at (295, 91) spanning 81 by 89 pixels.
; PLAN: r0=295(x), r1=91(y), r2=81(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 91
LDI r2, 81
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
