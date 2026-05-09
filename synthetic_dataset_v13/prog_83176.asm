; DESCRIPTION: Composite: Creates a black rectangular region at (161, 231) spanning 103 by 21 pixels then Renders a green line between points (219, 148) and (279, 16).
; PLAN: r0=161(x), r1=231(y), r2=103(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=219(x1), r6=148(y1), r7=279(x2), r8=16(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 161
LDI r1, 231
LDI r2, 103
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 148
LDI r7, 279
LDI r8, 16
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
