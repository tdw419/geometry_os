; DESCRIPTION: Composite: Places a cyan 72x99 rectangle at position (124, 18) then Places a blue line segment connecting (248, 236) to (181, 104).
; PLAN: r0=124(x), r1=18(y), r2=72(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x1), r6=236(y1), r7=181(x2), r8=104(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 124
LDI r1, 18
LDI r2, 72
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 236
LDI r7, 181
LDI r8, 104
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
