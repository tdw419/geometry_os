; DESCRIPTION: Creates a magenta rectangular region at (362, 152) spanning 117 by 68 pixels.
; PLAN: r0=362(x), r1=152(y), r2=117(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 152
LDI r2, 117
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
