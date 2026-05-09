; DESCRIPTION: Creates a cyan rectangular region at (8, 17) spanning 35 by 109 pixels.
; PLAN: r0=8(x), r1=17(y), r2=35(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 17
LDI r2, 35
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
