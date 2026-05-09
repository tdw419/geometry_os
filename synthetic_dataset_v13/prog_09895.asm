; DESCRIPTION: Creates a cyan rectangular region at (48, 13) spanning 33 by 61 pixels.
; PLAN: r0=48(x), r1=13(y), r2=33(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 13
LDI r2, 33
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
