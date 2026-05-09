; DESCRIPTION: Composite: Places a cyan dot at position (326, 255) then Renders a black box of size 113x112 starting at (66, 49) then Draws a cyan line from (54, 176) to (344, 229).
; PLAN: r0=326(x), r1=255(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=66(x), r6=49(y), r7=113(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x1), r11=176(y1), r12=344(x2), r13=229(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 255
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 49
LDI r7, 113
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 176
LDI r12, 344
LDI r13, 229
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
