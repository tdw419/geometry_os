; DESCRIPTION: Creates a cyan rectangular region at (409, 9) spanning 59 by 80 pixels.
; PLAN: r0=409(x), r1=9(y), r2=59(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 9
LDI r2, 59
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
