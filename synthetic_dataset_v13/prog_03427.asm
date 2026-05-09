; DESCRIPTION: Creates a cyan rectangular region at (174, 152) spanning 108 by 80 pixels.
; PLAN: r0=174(x), r1=152(y), r2=108(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 152
LDI r2, 108
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
