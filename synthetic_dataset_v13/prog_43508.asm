; DESCRIPTION: Creates a magenta rectangular region at (168, 23) spanning 57 by 70 pixels.
; PLAN: r0=168(x), r1=23(y), r2=57(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 23
LDI r2, 57
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
