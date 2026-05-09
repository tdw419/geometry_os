; DESCRIPTION: Creates a cyan rectangular region at (104, 165) spanning 13 by 40 pixels.
; PLAN: r0=104(x), r1=165(y), r2=13(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 165
LDI r2, 13
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
