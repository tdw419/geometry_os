; DESCRIPTION: Creates a green rectangular region at (265, 46) spanning 16 by 71 pixels.
; PLAN: r0=265(x), r1=46(y), r2=16(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 46
LDI r2, 16
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
