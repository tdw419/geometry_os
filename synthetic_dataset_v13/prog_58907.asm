; DESCRIPTION: Creates a cyan rectangular region at (39, 152) spanning 85 by 73 pixels.
; PLAN: r0=39(x), r1=152(y), r2=85(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 152
LDI r2, 85
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
