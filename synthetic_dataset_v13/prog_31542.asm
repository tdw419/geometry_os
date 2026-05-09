; DESCRIPTION: Composite: Places a yellow 109x44 rectangle at position (288, 70) then Draws a green line from (158, 206) to (481, 65).
; PLAN: r0=288(x), r1=70(y), r2=109(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=158(x1), r6=206(y1), r7=481(x2), r8=65(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 288
LDI r1, 70
LDI r2, 109
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 158
LDI r6, 206
LDI r7, 481
LDI r8, 65
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
