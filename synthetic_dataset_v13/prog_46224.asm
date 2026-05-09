; DESCRIPTION: Composite: Renders a cyan line between points (184, 194) and (124, 46) then Sets a single black pixel at (464, 189) then Renders a cyan box of size 55x80 starting at (322, 168).
; PLAN: r0=184(x1), r1=194(y1), r2=124(x2), r3=46(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=464(x), r6=189(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=322(x), r11=168(y), r12=55(width), r13=80(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 184
LDI r1, 194
LDI r2, 124
LDI r3, 46
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 464
LDI r6, 189
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 322
LDI r11, 168
LDI r12, 55
LDI r13, 80
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
