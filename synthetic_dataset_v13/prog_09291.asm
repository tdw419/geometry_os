; DESCRIPTION: Composite: Places a red 104x49 rectangle at position (382, 70) then Draws a white line from (24, 101) to (39, 46).
; PLAN: r0=382(x), r1=70(y), r2=104(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=24(x1), r6=101(y1), r7=39(x2), r8=46(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 70
LDI r2, 104
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 24
LDI r6, 101
LDI r7, 39
LDI r8, 46
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
