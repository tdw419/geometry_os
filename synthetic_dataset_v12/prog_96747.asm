; DESCRIPTION: Creates a magenta rectangular region at (433, 93) spanning 10 by 89 pixels.
; PLAN: r0=433(x), r1=93(y), r2=10(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 93
LDI r2, 10
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
