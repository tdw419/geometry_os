; DESCRIPTION: Creates a cyan rectangular region at (199, 60) spanning 38 by 111 pixels.
; PLAN: r0=199(x), r1=60(y), r2=38(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 60
LDI r2, 38
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
