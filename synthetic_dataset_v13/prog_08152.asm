; DESCRIPTION: Composite: Draws a green line from (196, 117) to (454, 112) then Draws a black rectangle at (98, 27) with width 112 and height 59 then Places a cyan dot at position (31, 231).
; PLAN: r0=196(x1), r1=117(y1), r2=454(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=27(y), r7=112(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=31(x), r11=231(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 117
LDI r2, 454
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 27
LDI r7, 112
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 31
LDI r11, 231
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
