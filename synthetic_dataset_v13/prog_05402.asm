; DESCRIPTION: Creates a cyan rectangular region at (419, 20) spanning 37 by 111 pixels.
; PLAN: r0=419(x), r1=20(y), r2=37(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 419
LDI r1, 20
LDI r2, 37
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
