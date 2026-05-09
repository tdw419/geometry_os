; DESCRIPTION: Creates a red rectangular region at (73, 19) spanning 32 by 63 pixels.
; PLAN: r0=73(x), r1=19(y), r2=32(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 19
LDI r2, 32
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
