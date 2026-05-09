; DESCRIPTION: Creates a cyan rectangular region at (370, 120) spanning 25 by 118 pixels.
; PLAN: r0=370(x), r1=120(y), r2=25(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 120
LDI r2, 25
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
