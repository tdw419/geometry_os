; DESCRIPTION: Creates a magenta rectangular region at (202, 211) spanning 19 by 12 pixels.
; PLAN: r0=202(x), r1=211(y), r2=19(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 211
LDI r2, 19
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
