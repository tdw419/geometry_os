; DESCRIPTION: Composite: Renders a cyan line between points (269, 196) and (31, 202) then Draws a white rectangle at (471, 79) with width 14 and height 45.
; PLAN: r0=269(x1), r1=196(y1), r2=31(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=471(x), r6=79(y), r7=14(width), r8=45(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 196
LDI r2, 31
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 79
LDI r7, 14
LDI r8, 45
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
