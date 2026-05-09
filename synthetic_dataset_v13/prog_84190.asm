; DESCRIPTION: Composite: Creates a cyan circular shape at (204, 166) with radius 77 then Places a blue dot at position (279, 118) then Places a yellow line segment connecting (34, 53) to (482, 111).
; PLAN: r0=204(x), r1=166(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=118(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=34(x1), r11=53(y1), r12=482(x2), r13=111(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 204
LDI r1, 166
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 118
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 34
LDI r11, 53
LDI r12, 482
LDI r13, 111
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
