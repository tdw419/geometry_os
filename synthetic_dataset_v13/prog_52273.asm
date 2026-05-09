; DESCRIPTION: Creates a magenta rectangular region at (271, 146) spanning 64 by 29 pixels.
; PLAN: r0=271(x), r1=146(y), r2=64(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 146
LDI r2, 64
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
