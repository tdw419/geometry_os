; DESCRIPTION: Creates a magenta rectangular region at (231, 215) spanning 65 by 20 pixels.
; PLAN: r0=231(x), r1=215(y), r2=65(width), r3=20(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 215
LDI r2, 65
LDI r3, 20
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
