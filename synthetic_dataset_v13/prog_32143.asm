; DESCRIPTION: Creates a cyan rectangular region at (17, 120) spanning 96 by 114 pixels.
; PLAN: r0=17(x), r1=120(y), r2=96(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 120
LDI r2, 96
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
