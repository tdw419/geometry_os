; DESCRIPTION: Creates a magenta rectangular region at (286, 7) spanning 117 by 83 pixels.
; PLAN: r0=286(x), r1=7(y), r2=117(width), r3=83(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 7
LDI r2, 117
LDI r3, 83
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
