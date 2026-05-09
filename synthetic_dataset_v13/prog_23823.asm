; DESCRIPTION: Composite: Places a yellow 38x74 rectangle at position (400, 152) then Draws a magenta line from (98, 66) to (221, 161) then Sets a single white pixel at (54, 204).
; PLAN: r0=400(x), r1=152(y), r2=38(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x1), r6=66(y1), r7=221(x2), r8=161(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=54(x), r11=204(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 400
LDI r1, 152
LDI r2, 38
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 66
LDI r7, 221
LDI r8, 161
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 204
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
