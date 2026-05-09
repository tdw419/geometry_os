; DESCRIPTION: Creates a green rectangular region at (61, 81) spanning 42 by 46 pixels.
; PLAN: r0=61(x), r1=81(y), r2=42(width), r3=46(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 81
LDI r2, 42
LDI r3, 46
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
