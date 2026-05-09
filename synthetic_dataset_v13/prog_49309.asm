; DESCRIPTION: Creates a yellow rectangular region at (198, 127) spanning 54 by 65 pixels.
; PLAN: r0=198(x), r1=127(y), r2=54(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 127
LDI r2, 54
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
