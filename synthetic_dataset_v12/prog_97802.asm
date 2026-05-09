; DESCRIPTION: Creates a magenta rectangular region at (333, 82) spanning 115 by 95 pixels.
; PLAN: r0=333(x), r1=82(y), r2=115(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 82
LDI r2, 115
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
