; DESCRIPTION: Composite: Places a green dot at position (35, 138) then Draws a yellow line from (263, 203) to (209, 70).
; PLAN: r0=35(x), r1=138(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=263(x1), r6=203(y1), r7=209(x2), r8=70(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 138
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 263
LDI r6, 203
LDI r7, 209
LDI r8, 70
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
