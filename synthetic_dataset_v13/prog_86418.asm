; DESCRIPTION: Creates a magenta rectangular region at (379, 187) spanning 47 by 42 pixels.
; PLAN: r0=379(x), r1=187(y), r2=47(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 187
LDI r2, 47
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
