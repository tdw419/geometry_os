; DESCRIPTION: Creates a cyan rectangular region at (346, 28) spanning 73 by 91 pixels.
; PLAN: r0=346(x), r1=28(y), r2=73(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 28
LDI r2, 73
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
