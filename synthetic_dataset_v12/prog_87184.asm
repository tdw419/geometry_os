; DESCRIPTION: Creates a magenta rectangular region at (264, 44) spanning 18 by 48 pixels.
; PLAN: r0=264(x), r1=44(y), r2=18(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 44
LDI r2, 18
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
