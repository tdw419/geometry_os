; DESCRIPTION: Composite: Draws a red rectangle at (57, 63) with width 110 and height 44 then Renders a cyan line between points (152, 186) and (32, 227).
; PLAN: r0=57(x), r1=63(y), r2=110(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=152(x1), r6=186(y1), r7=32(x2), r8=227(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 63
LDI r2, 110
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 186
LDI r7, 32
LDI r8, 227
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
