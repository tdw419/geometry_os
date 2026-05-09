; DESCRIPTION: Composite: Places a white 80x28 rectangle at position (50, 12) then Draws a magenta line from (71, 230) to (73, 233).
; PLAN: r0=50(x), r1=12(y), r2=80(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=71(x1), r6=230(y1), r7=73(x2), r8=233(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 50
LDI r1, 12
LDI r2, 80
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 230
LDI r7, 73
LDI r8, 233
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
