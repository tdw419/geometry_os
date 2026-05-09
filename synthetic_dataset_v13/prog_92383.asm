; DESCRIPTION: Creates a magenta rectangular region at (129, 71) spanning 103 by 16 pixels.
; PLAN: r0=129(x), r1=71(y), r2=103(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 71
LDI r2, 103
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
