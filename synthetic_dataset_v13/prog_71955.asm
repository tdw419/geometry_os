; DESCRIPTION: Creates a white rectangular region at (160, 162) spanning 117 by 39 pixels.
; PLAN: r0=160(x), r1=162(y), r2=117(width), r3=39(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 162
LDI r2, 117
LDI r3, 39
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
