; DESCRIPTION: Creates a cyan rectangular region at (71, 5) spanning 47 by 17 pixels.
; PLAN: r0=71(x), r1=5(y), r2=47(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 5
LDI r2, 47
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
