; DESCRIPTION: Creates a cyan rectangular region at (285, 28) spanning 95 by 38 pixels.
; PLAN: r0=285(x), r1=28(y), r2=95(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 28
LDI r2, 95
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
