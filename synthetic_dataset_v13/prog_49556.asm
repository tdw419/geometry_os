; DESCRIPTION: Creates a cyan rectangular region at (136, 21) spanning 61 by 14 pixels.
; PLAN: r0=136(x), r1=21(y), r2=61(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 21
LDI r2, 61
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
