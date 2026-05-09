; DESCRIPTION: Creates a magenta rectangular region at (403, 161) spanning 37 by 21 pixels.
; PLAN: r0=403(x), r1=161(y), r2=37(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 161
LDI r2, 37
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
