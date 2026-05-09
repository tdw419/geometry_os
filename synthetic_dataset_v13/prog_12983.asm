; DESCRIPTION: Creates a cyan rectangular region at (362, 91) spanning 80 by 40 pixels.
; PLAN: r0=362(x), r1=91(y), r2=80(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 91
LDI r2, 80
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
