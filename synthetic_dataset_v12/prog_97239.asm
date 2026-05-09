; DESCRIPTION: Creates a cyan rectangular region at (320, 219) spanning 27 by 34 pixels.
; PLAN: r0=320(x), r1=219(y), r2=27(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 219
LDI r2, 27
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
