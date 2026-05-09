; DESCRIPTION: Creates a green rectangular region at (196, 42) spanning 15 by 27 pixels.
; PLAN: r0=196(x), r1=42(y), r2=15(width), r3=27(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 42
LDI r2, 15
LDI r3, 27
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
