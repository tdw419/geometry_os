; DESCRIPTION: Creates a green rectangular region at (297, 42) spanning 48 by 28 pixels.
; PLAN: r0=297(x), r1=42(y), r2=48(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 42
LDI r2, 48
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
