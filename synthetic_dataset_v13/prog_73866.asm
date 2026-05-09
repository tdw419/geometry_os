; DESCRIPTION: Creates a cyan rectangular region at (186, 124) spanning 95 by 30 pixels.
; PLAN: r0=186(x), r1=124(y), r2=95(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 124
LDI r2, 95
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
