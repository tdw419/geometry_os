; DESCRIPTION: Composite: Draws a yellow line from (145, 102) to (371, 211) then Places a black 36x70 rectangle at position (103, 21).
; PLAN: r0=145(x1), r1=102(y1), r2=371(x2), r3=211(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=21(y), r7=36(width), r8=70(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 102
LDI r2, 371
LDI r3, 211
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 21
LDI r7, 36
LDI r8, 70
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
