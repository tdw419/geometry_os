; DESCRIPTION: Creates a cyan rectangular region at (328, 7) spanning 117 by 14 pixels.
; PLAN: r0=328(x), r1=7(y), r2=117(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 7
LDI r2, 117
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
