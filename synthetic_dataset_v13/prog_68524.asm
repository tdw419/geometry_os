; DESCRIPTION: Creates a magenta rectangular region at (256, 129) spanning 98 by 61 pixels.
; PLAN: r0=256(x), r1=129(y), r2=98(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 129
LDI r2, 98
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
