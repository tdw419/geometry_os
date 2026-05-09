; DESCRIPTION: Creates a cyan rectangular region at (285, 113) spanning 91 by 96 pixels.
; PLAN: r0=285(x), r1=113(y), r2=91(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 113
LDI r2, 91
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
