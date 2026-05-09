; DESCRIPTION: Creates a cyan rectangular region at (398, 124) spanning 56 by 94 pixels.
; PLAN: r0=398(x), r1=124(y), r2=56(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 124
LDI r2, 56
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
