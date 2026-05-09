; DESCRIPTION: Creates a magenta rectangular region at (305, 93) spanning 27 by 90 pixels.
; PLAN: r0=305(x), r1=93(y), r2=27(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 93
LDI r2, 27
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
