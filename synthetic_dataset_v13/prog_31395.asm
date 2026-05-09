; DESCRIPTION: Creates a cyan rectangular region at (199, 142) spanning 95 by 96 pixels.
; PLAN: r0=199(x), r1=142(y), r2=95(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 142
LDI r2, 95
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
