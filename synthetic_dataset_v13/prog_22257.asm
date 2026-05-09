; DESCRIPTION: Creates a cyan rectangular region at (198, 71) spanning 21 by 114 pixels.
; PLAN: r0=198(x), r1=71(y), r2=21(width), r3=114(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 71
LDI r2, 21
LDI r3, 114
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
