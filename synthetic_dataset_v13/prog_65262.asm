; DESCRIPTION: Creates a magenta rectangular region at (74, 129) spanning 56 by 53 pixels.
; PLAN: r0=74(x), r1=129(y), r2=56(width), r3=53(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 129
LDI r2, 56
LDI r3, 53
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
