; DESCRIPTION: Creates a cyan rectangular region at (308, 119) spanning 113 by 77 pixels.
; PLAN: r0=308(x), r1=119(y), r2=113(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 119
LDI r2, 113
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
