; DESCRIPTION: Composite: Draws a yellow line from (212, 5) to (180, 128) then Places a purple 44x107 rectangle at position (400, 98).
; PLAN: r0=212(x1), r1=5(y1), r2=180(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=98(y), r7=44(width), r8=107(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 5
LDI r2, 180
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 98
LDI r7, 44
LDI r8, 107
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
