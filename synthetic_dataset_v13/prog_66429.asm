; DESCRIPTION: Composite: Places a yellow 102x97 rectangle at position (15, 32) then Draws a black line from (16, 207) to (174, 200).
; PLAN: r0=15(x), r1=32(y), r2=102(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=207(y1), r7=174(x2), r8=200(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 15
LDI r1, 32
LDI r2, 102
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 207
LDI r7, 174
LDI r8, 200
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
