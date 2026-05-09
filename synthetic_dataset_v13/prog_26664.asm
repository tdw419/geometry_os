; DESCRIPTION: Creates a cyan rectangular region at (298, 207) spanning 60 by 18 pixels.
; PLAN: r0=298(x), r1=207(y), r2=60(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 207
LDI r2, 60
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
