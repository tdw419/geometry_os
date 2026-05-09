; DESCRIPTION: Creates a green rectangular region at (346, 168) spanning 12 by 68 pixels.
; PLAN: r0=346(x), r1=168(y), r2=12(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 168
LDI r2, 12
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
