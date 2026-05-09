; DESCRIPTION: Creates a cyan rectangular region at (298, 40) spanning 31 by 120 pixels.
; PLAN: r0=298(x), r1=40(y), r2=31(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 40
LDI r2, 31
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
