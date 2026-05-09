; DESCRIPTION: Creates a magenta rectangular region at (242, 188) spanning 61 by 40 pixels.
; PLAN: r0=242(x), r1=188(y), r2=61(width), r3=40(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 188
LDI r2, 61
LDI r3, 40
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
