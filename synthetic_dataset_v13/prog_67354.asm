; DESCRIPTION: Creates a black rectangular region at (218, 162) spanning 113 by 70 pixels.
; PLAN: r0=218(x), r1=162(y), r2=113(width), r3=70(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 162
LDI r2, 113
LDI r3, 70
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
