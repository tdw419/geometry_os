; DESCRIPTION: Composite: Places a white line segment connecting (410, 186) to (29, 202) then Creates a blue rectangular region at (219, 46) spanning 116 by 16 pixels.
; PLAN: r0=410(x1), r1=186(y1), r2=29(x2), r3=202(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=46(y), r7=116(width), r8=16(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 186
LDI r2, 29
LDI r3, 202
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 46
LDI r7, 116
LDI r8, 16
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
