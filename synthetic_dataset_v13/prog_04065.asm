; DESCRIPTION: Composite: Draws a red line from (502, 147) to (23, 97) then Draws a cyan rectangle at (275, 37) with width 112 and height 57.
; PLAN: r0=502(x1), r1=147(y1), r2=23(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=37(y), r7=112(width), r8=57(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 502
LDI r1, 147
LDI r2, 23
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 37
LDI r7, 112
LDI r8, 57
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
