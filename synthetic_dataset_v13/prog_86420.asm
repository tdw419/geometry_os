; DESCRIPTION: Composite: Places a red dot at position (284, 251) then Creates a green rectangular region at (121, 93) spanning 93 by 37 pixels then Renders a green line between points (202, 97) and (150, 117).
; PLAN: r0=284(x), r1=251(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=121(x), r6=93(y), r7=93(width), r8=37(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=202(x1), r11=97(y1), r12=150(x2), r13=117(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 284
LDI r1, 251
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 121
LDI r6, 93
LDI r7, 93
LDI r8, 37
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 97
LDI r12, 150
LDI r13, 117
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
