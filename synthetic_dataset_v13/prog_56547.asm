; DESCRIPTION: Creates a red rectangular region at (206, 55) spanning 22 by 70 pixels.
; PLAN: r0=206(x), r1=55(y), r2=22(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 55
LDI r2, 22
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
