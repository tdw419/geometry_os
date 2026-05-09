; DESCRIPTION: Composite: Places a blue circle of radius 10 at center (500, 15) then Draws a cyan line from (511, 39) to (413, 202) then Places a white dot at position (353, 166).
; PLAN: r0=500(x), r1=15(y), r2=10(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=511(x1), r6=39(y1), r7=413(x2), r8=202(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=166(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 500
LDI r1, 15
LDI r2, 10
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 511
LDI r6, 39
LDI r7, 413
LDI r8, 202
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 166
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
