; DESCRIPTION: Creates a cyan rectangular region at (260, 33) spanning 95 by 99 pixels.
; PLAN: r0=260(x), r1=33(y), r2=95(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 33
LDI r2, 95
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
