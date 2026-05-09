; DESCRIPTION: Composite: Draws a red line from (208, 253) to (330, 81) then Renders a white box of size 25x52 starting at (186, 161).
; PLAN: r0=208(x1), r1=253(y1), r2=330(x2), r3=81(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=161(y), r7=25(width), r8=52(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 208
LDI r1, 253
LDI r2, 330
LDI r3, 81
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 161
LDI r7, 25
LDI r8, 52
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
