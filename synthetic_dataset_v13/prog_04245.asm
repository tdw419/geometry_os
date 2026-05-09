; DESCRIPTION: Creates a magenta rectangular region at (170, 215) spanning 109 by 22 pixels.
; PLAN: r0=170(x), r1=215(y), r2=109(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 215
LDI r2, 109
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
