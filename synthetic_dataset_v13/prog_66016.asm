; DESCRIPTION: Creates a magenta rectangular region at (213, 152) spanning 63 by 86 pixels.
; PLAN: r0=213(x), r1=152(y), r2=63(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 152
LDI r2, 63
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
