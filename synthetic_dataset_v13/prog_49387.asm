; DESCRIPTION: Creates a magenta rectangular region at (295, 18) spanning 37 by 47 pixels.
; PLAN: r0=295(x), r1=18(y), r2=37(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 18
LDI r2, 37
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
