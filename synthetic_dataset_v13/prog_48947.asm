; DESCRIPTION: Creates a cyan rectangular region at (352, 84) spanning 43 by 36 pixels.
; PLAN: r0=352(x), r1=84(y), r2=43(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 84
LDI r2, 43
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
