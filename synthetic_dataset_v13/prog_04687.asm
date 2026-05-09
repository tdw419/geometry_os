; DESCRIPTION: Creates a cyan rectangular region at (198, 37) spanning 72 by 28 pixels.
; PLAN: r0=198(x), r1=37(y), r2=72(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 37
LDI r2, 72
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
