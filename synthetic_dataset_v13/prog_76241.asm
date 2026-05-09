; DESCRIPTION: Creates a magenta rectangular region at (255, 86) spanning 90 by 57 pixels.
; PLAN: r0=255(x), r1=86(y), r2=90(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 86
LDI r2, 90
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
