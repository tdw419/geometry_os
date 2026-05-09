; DESCRIPTION: Creates a magenta rectangular region at (60, 71) spanning 93 by 80 pixels.
; PLAN: r0=60(x), r1=71(y), r2=93(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 71
LDI r2, 93
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
