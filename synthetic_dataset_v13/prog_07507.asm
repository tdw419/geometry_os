; DESCRIPTION: Creates a red rectangular region at (95, 127) spanning 40 by 58 pixels.
; PLAN: r0=95(x), r1=127(y), r2=40(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 127
LDI r2, 40
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
