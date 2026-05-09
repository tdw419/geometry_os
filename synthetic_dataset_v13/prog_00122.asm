; DESCRIPTION: Creates a red rectangular region at (106, 58) spanning 63 by 107 pixels.
; PLAN: r0=106(x), r1=58(y), r2=63(width), r3=107(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 58
LDI r2, 63
LDI r3, 107
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
