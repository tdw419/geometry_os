; DESCRIPTION: Creates a cyan rectangular region at (199, 48) spanning 52 by 69 pixels.
; PLAN: r0=199(x), r1=48(y), r2=52(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 48
LDI r2, 52
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
