; DESCRIPTION: Composite: Draws a green line from (186, 151) to (469, 132) then Renders a cyan box of size 59x49 starting at (205, 150).
; PLAN: r0=186(x1), r1=151(y1), r2=469(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=205(x), r6=150(y), r7=59(width), r8=49(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 186
LDI r1, 151
LDI r2, 469
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 150
LDI r7, 59
LDI r8, 49
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
