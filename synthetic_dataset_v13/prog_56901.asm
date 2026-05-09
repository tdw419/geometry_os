; DESCRIPTION: Creates a magenta rectangular region at (410, 177) spanning 96 by 35 pixels.
; PLAN: r0=410(x), r1=177(y), r2=96(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 177
LDI r2, 96
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
