; DESCRIPTION: Creates a cyan rectangular region at (423, 112) spanning 61 by 73 pixels.
; PLAN: r0=423(x), r1=112(y), r2=61(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 112
LDI r2, 61
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
