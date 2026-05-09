; DESCRIPTION: Creates a red rectangular region at (206, 119) spanning 79 by 27 pixels.
; PLAN: r0=206(x), r1=119(y), r2=79(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 119
LDI r2, 79
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
