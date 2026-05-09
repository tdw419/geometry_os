; DESCRIPTION: Composite: Creates a blue rectangular region at (431, 67) spanning 66 by 77 pixels then Places a red line segment connecting (243, 16) to (444, 111) then Places a green dot at position (321, 108).
; PLAN: r0=431(x), r1=67(y), r2=66(width), r3=77(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=243(x1), r6=16(y1), r7=444(x2), r8=111(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=321(x), r11=108(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 431
LDI r1, 67
LDI r2, 66
LDI r3, 77
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 243
LDI r6, 16
LDI r7, 444
LDI r8, 111
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 108
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
