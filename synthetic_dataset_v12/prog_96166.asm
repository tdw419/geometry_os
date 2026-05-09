; DESCRIPTION: Creates a cyan rectangular region at (416, 16) spanning 51 by 70 pixels.
; PLAN: r0=416(x), r1=16(y), r2=51(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 16
LDI r2, 51
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
