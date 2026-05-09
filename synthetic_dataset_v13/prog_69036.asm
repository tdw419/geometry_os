; DESCRIPTION: Creates a magenta rectangular region at (238, 129) spanning 86 by 68 pixels.
; PLAN: r0=238(x), r1=129(y), r2=86(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 129
LDI r2, 86
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
