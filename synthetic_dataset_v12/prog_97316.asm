; DESCRIPTION: Composite: Places a blue dot at position (258, 229) then Draws a white rectangle at (409, 25) with width 32 and height 114 then Renders a red line between points (408, 13) and (365, 27).
; PLAN: r0=258(x), r1=229(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=409(x), r6=25(y), r7=32(width), r8=114(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x1), r11=13(y1), r12=365(x2), r13=27(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 258
LDI r1, 229
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 25
LDI r7, 32
LDI r8, 114
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 13
LDI r12, 365
LDI r13, 27
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
