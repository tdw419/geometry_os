; DESCRIPTION: Creates a cyan rectangular region at (298, 61) spanning 112 by 100 pixels.
; PLAN: r0=298(x), r1=61(y), r2=112(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 61
LDI r2, 112
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
