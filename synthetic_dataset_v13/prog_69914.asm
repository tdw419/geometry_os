; DESCRIPTION: Creates a cyan rectangular region at (403, 20) spanning 81 by 110 pixels.
; PLAN: r0=403(x), r1=20(y), r2=81(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 20
LDI r2, 81
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
