; DESCRIPTION: Creates a red rectangular region at (193, 82) spanning 73 by 83 pixels.
; PLAN: r0=193(x), r1=82(y), r2=73(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 82
LDI r2, 73
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
