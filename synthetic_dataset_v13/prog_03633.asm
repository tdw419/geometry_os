; DESCRIPTION: Creates a cyan rectangular region at (142, 120) spanning 98 by 14 pixels.
; PLAN: r0=142(x), r1=120(y), r2=98(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 120
LDI r2, 98
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
