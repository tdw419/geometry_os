; DESCRIPTION: Creates a magenta rectangular region at (304, 146) spanning 10 by 46 pixels.
; PLAN: r0=304(x), r1=146(y), r2=10(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 146
LDI r2, 10
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
