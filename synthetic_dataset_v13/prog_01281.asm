; DESCRIPTION: Composite: Places a cyan line segment connecting (261, 108) to (345, 89) then Places a yellow dot at position (455, 235) then Renders a red box of size 68x80 starting at (171, 87).
; PLAN: r0=261(x1), r1=108(y1), r2=345(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=235(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=171(x), r11=87(y), r12=68(width), r13=80(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 108
LDI r2, 345
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 235
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 171
LDI r11, 87
LDI r12, 68
LDI r13, 80
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
