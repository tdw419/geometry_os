; DESCRIPTION: Creates a magenta rectangular region at (197, 123) spanning 91 by 80 pixels.
; PLAN: r0=197(x), r1=123(y), r2=91(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 123
LDI r2, 91
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
