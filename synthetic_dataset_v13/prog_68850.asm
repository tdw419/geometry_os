; DESCRIPTION: Creates a magenta rectangular region at (153, 129) spanning 47 by 72 pixels.
; PLAN: r0=153(x), r1=129(y), r2=47(width), r3=72(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 129
LDI r2, 47
LDI r3, 72
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
