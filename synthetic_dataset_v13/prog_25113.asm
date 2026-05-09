; DESCRIPTION: Composite: Draws a black line from (25, 20) to (57, 167) then Places a red 38x20 rectangle at position (275, 161).
; PLAN: r0=25(x1), r1=20(y1), r2=57(x2), r3=167(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=161(y), r7=38(width), r8=20(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 25
LDI r1, 20
LDI r2, 57
LDI r3, 167
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 161
LDI r7, 38
LDI r8, 20
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
