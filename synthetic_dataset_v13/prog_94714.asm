; DESCRIPTION: Creates a cyan rectangular region at (197, 135) spanning 21 by 75 pixels.
; PLAN: r0=197(x), r1=135(y), r2=21(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 135
LDI r2, 21
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
