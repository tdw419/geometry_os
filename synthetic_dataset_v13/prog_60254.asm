; DESCRIPTION: Composite: Places a cyan 98x19 rectangle at position (110, 157) then Renders a blue line between points (104, 211) and (181, 84).
; PLAN: r0=110(x), r1=157(y), r2=98(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x1), r6=211(y1), r7=181(x2), r8=84(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 157
LDI r2, 98
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 211
LDI r7, 181
LDI r8, 84
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
