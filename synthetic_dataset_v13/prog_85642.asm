; DESCRIPTION: Composite: Draws a cyan line from (372, 114) to (371, 66) then Creates a white rectangular region at (259, 200) spanning 82 by 37 pixels.
; PLAN: r0=372(x1), r1=114(y1), r2=371(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=259(x), r6=200(y), r7=82(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 114
LDI r2, 371
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 200
LDI r7, 82
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
