; DESCRIPTION: Creates a green rectangular region at (168, 128) spanning 74 by 10 pixels.
; PLAN: r0=168(x), r1=128(y), r2=74(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 128
LDI r2, 74
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
