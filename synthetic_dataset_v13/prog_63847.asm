; DESCRIPTION: Creates a green rectangular region at (460, 63) spanning 14 by 68 pixels.
; PLAN: r0=460(x), r1=63(y), r2=14(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 63
LDI r2, 14
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
