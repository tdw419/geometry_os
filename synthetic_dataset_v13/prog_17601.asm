; DESCRIPTION: Creates a red rectangular region at (127, 152) spanning 71 by 75 pixels.
; PLAN: r0=127(x), r1=152(y), r2=71(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 152
LDI r2, 71
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
