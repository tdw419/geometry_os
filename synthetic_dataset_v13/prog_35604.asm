; DESCRIPTION: Composite: Places a white 51x103 rectangle at position (223, 90) then Renders a orange line between points (412, 167) and (310, 231).
; PLAN: r0=223(x), r1=90(y), r2=51(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x1), r6=167(y1), r7=310(x2), r8=231(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 90
LDI r2, 51
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 167
LDI r7, 310
LDI r8, 231
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
