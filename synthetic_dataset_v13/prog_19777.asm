; DESCRIPTION: Composite: Places a yellow 43x50 rectangle at position (211, 196) then Draws a blue line from (277, 111) to (74, 96).
; PLAN: r0=211(x), r1=196(y), r2=43(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=277(x1), r6=111(y1), r7=74(x2), r8=96(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 211
LDI r1, 196
LDI r2, 43
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 111
LDI r7, 74
LDI r8, 96
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
