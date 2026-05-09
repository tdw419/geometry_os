; DESCRIPTION: Composite: Places a yellow 90x56 rectangle at position (361, 171) then Draws a green line from (313, 106) to (115, 157).
; PLAN: r0=361(x), r1=171(y), r2=90(width), r3=56(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x1), r6=106(y1), r7=115(x2), r8=157(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 361
LDI r1, 171
LDI r2, 90
LDI r3, 56
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 106
LDI r7, 115
LDI r8, 157
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
