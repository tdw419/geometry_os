; DESCRIPTION: Creates a magenta rectangular region at (98, 215) spanning 48 by 37 pixels.
; PLAN: r0=98(x), r1=215(y), r2=48(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 215
LDI r2, 48
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
