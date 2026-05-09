; DESCRIPTION: Creates a magenta rectangular region at (208, 154) spanning 37 by 79 pixels.
; PLAN: r0=208(x), r1=154(y), r2=37(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 154
LDI r2, 37
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
