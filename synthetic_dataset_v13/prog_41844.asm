; DESCRIPTION: Creates a red rectangular region at (84, 47) spanning 42 by 47 pixels.
; PLAN: r0=84(x), r1=47(y), r2=42(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 47
LDI r2, 42
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
