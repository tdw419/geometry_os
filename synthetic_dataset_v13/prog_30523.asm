; DESCRIPTION: Creates a green rectangular region at (321, 64) spanning 92 by 42 pixels.
; PLAN: r0=321(x), r1=64(y), r2=92(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 64
LDI r2, 92
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
