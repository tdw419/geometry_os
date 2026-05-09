; DESCRIPTION: Creates a red rectangular region at (82, 149) spanning 77 by 70 pixels.
; PLAN: r0=82(x), r1=149(y), r2=77(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 149
LDI r2, 77
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
