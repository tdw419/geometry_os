; DESCRIPTION: Composite: Draws a white line from (403, 8) to (282, 120) then Renders a white box of size 117x105 starting at (77, 87) then Places a purple dot at position (420, 189).
; PLAN: r0=403(x1), r1=8(y1), r2=282(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=87(y), r7=117(width), r8=105(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=420(x), r11=189(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 8
LDI r2, 282
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 87
LDI r7, 117
LDI r8, 105
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 189
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
