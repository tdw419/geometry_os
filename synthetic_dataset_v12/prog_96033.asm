; DESCRIPTION: Creates a cyan rectangular region at (207, 37) spanning 80 by 52 pixels.
; PLAN: r0=207(x), r1=37(y), r2=80(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 37
LDI r2, 80
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
