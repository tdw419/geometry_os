; DESCRIPTION: Creates a cyan rectangular region at (143, 113) spanning 59 by 97 pixels.
; PLAN: r0=143(x), r1=113(y), r2=59(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 113
LDI r2, 59
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
