; DESCRIPTION: Creates a magenta rectangular region at (401, 46) spanning 46 by 75 pixels.
; PLAN: r0=401(x), r1=46(y), r2=46(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 46
LDI r2, 46
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
