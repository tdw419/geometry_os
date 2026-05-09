; DESCRIPTION: Composite: Creates a cyan circular shape at (38, 204) with radius 31 then Draws a white line from (30, 193) to (227, 128) then Draws a white rectangle at (393, 227) with width 30 and height 26.
; PLAN: r0=38(x), r1=204(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=30(x1), r6=193(y1), r7=227(x2), r8=128(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=227(y), r12=30(width), r13=26(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 204
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 30
LDI r6, 193
LDI r7, 227
LDI r8, 128
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 227
LDI r12, 30
LDI r13, 26
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
