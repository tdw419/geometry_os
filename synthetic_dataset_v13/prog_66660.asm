; DESCRIPTION: Creates a cyan rectangular region at (398, 202) spanning 74 by 15 pixels.
; PLAN: r0=398(x), r1=202(y), r2=74(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 202
LDI r2, 74
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
