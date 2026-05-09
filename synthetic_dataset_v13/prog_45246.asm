; DESCRIPTION: Creates a cyan rectangular region at (38, 152) spanning 71 by 12 pixels.
; PLAN: r0=38(x), r1=152(y), r2=71(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 152
LDI r2, 71
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
