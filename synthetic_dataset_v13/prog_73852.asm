; DESCRIPTION: Creates a cyan rectangular region at (142, 81) spanning 52 by 38 pixels.
; PLAN: r0=142(x), r1=81(y), r2=52(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 81
LDI r2, 52
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
