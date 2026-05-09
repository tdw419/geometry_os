; DESCRIPTION: Creates a cyan rectangular region at (199, 151) spanning 100 by 10 pixels.
; PLAN: r0=199(x), r1=151(y), r2=100(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 151
LDI r2, 100
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
