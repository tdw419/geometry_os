; DESCRIPTION: Creates a magenta rectangular region at (121, 129) spanning 95 by 12 pixels.
; PLAN: r0=121(x), r1=129(y), r2=95(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 129
LDI r2, 95
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
