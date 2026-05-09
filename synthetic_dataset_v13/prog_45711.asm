; DESCRIPTION: Creates a magenta rectangular region at (444, 48) spanning 47 by 109 pixels.
; PLAN: r0=444(x), r1=48(y), r2=47(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 48
LDI r2, 47
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
