; DESCRIPTION: Composite: Places a black 73x103 rectangle at position (148, 122) then Renders a cyan line between points (149, 210) and (390, 115).
; PLAN: r0=148(x), r1=122(y), r2=73(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=149(x1), r6=210(y1), r7=390(x2), r8=115(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 122
LDI r2, 73
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 210
LDI r7, 390
LDI r8, 115
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
