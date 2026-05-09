; DESCRIPTION: Creates a cyan rectangular region at (255, 155) spanning 116 by 77 pixels.
; PLAN: r0=255(x), r1=155(y), r2=116(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 155
LDI r2, 116
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
