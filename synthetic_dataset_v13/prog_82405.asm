; DESCRIPTION: Creates a green rectangular region at (480, 36) spanning 23 by 57 pixels.
; PLAN: r0=480(x), r1=36(y), r2=23(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 36
LDI r2, 23
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
