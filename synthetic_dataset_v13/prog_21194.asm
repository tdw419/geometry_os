; DESCRIPTION: Creates a cyan rectangular region at (221, 136) spanning 36 by 117 pixels.
; PLAN: r0=221(x), r1=136(y), r2=36(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 136
LDI r2, 36
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
