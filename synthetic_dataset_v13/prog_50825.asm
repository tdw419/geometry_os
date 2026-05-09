; DESCRIPTION: Creates a cyan rectangular region at (398, 73) spanning 89 by 30 pixels.
; PLAN: r0=398(x), r1=73(y), r2=89(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 73
LDI r2, 89
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
