; DESCRIPTION: Creates a green rectangular region at (215, 186) spanning 87 by 34 pixels.
; PLAN: r0=215(x), r1=186(y), r2=87(width), r3=34(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 186
LDI r2, 87
LDI r3, 34
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
