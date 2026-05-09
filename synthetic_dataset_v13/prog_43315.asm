; DESCRIPTION: Creates a magenta rectangular region at (281, 24) spanning 52 by 44 pixels.
; PLAN: r0=281(x), r1=24(y), r2=52(width), r3=44(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 24
LDI r2, 52
LDI r3, 44
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
