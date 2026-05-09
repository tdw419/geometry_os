; DESCRIPTION: Composite: Draws a black line from (107, 128) to (290, 218) then Places a blue 78x19 rectangle at position (197, 225).
; PLAN: r0=107(x1), r1=128(y1), r2=290(x2), r3=218(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=225(y), r7=78(width), r8=19(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 107
LDI r1, 128
LDI r2, 290
LDI r3, 218
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 225
LDI r7, 78
LDI r8, 19
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
