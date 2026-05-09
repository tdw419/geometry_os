; DESCRIPTION: Composite: Creates a black rectangular region at (283, 204) spanning 60 by 44 pixels then Draws a orange line from (240, 91) to (372, 194) then Places a cyan dot at position (56, 81).
; PLAN: r0=283(x), r1=204(y), r2=60(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=240(x1), r6=91(y1), r7=372(x2), r8=194(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=56(x), r11=81(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 204
LDI r2, 60
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 91
LDI r7, 372
LDI r8, 194
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 56
LDI r11, 81
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
