; DESCRIPTION: Composite: Places a blue dot at position (209, 60) then Places a green 30x81 rectangle at position (117, 75) then Draws a cyan line from (89, 249) to (313, 98).
; PLAN: r0=209(x), r1=60(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=117(x), r6=75(y), r7=30(width), r8=81(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=89(x1), r11=249(y1), r12=313(x2), r13=98(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 209
LDI r1, 60
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 117
LDI r6, 75
LDI r7, 30
LDI r8, 81
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 249
LDI r12, 313
LDI r13, 98
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
