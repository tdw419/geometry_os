; DESCRIPTION: Creates a red rectangular region at (133, 150) spanning 66 by 42 pixels.
; PLAN: r0=133(x), r1=150(y), r2=66(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 150
LDI r2, 66
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
