; DESCRIPTION: Creates a magenta rectangular region at (368, 132) spanning 45 by 115 pixels.
; PLAN: r0=368(x), r1=132(y), r2=45(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 132
LDI r2, 45
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
