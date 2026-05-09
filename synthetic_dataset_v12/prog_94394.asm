; DESCRIPTION: Creates a magenta rectangular region at (80, 93) spanning 45 by 45 pixels.
; PLAN: r0=80(x), r1=93(y), r2=45(width), r3=45(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 93
LDI r2, 45
LDI r3, 45
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
