; DESCRIPTION: Creates a cyan rectangular region at (17, 225) spanning 16 by 15 pixels.
; PLAN: r0=17(x), r1=225(y), r2=16(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 225
LDI r2, 16
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
