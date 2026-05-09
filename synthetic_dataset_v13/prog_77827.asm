; DESCRIPTION: Creates a cyan rectangular region at (272, 36) spanning 93 by 88 pixels.
; PLAN: r0=272(x), r1=36(y), r2=93(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 36
LDI r2, 93
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
