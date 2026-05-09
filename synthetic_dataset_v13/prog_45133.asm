; DESCRIPTION: Composite: Places a magenta dot at position (281, 247) then Places a red 31x112 rectangle at position (50, 112) then Renders a yellow line between points (207, 59) and (387, 78).
; PLAN: r0=281(x), r1=247(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=50(x), r6=112(y), r7=31(width), r8=112(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x1), r11=59(y1), r12=387(x2), r13=78(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 247
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 50
LDI r6, 112
LDI r7, 31
LDI r8, 112
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 59
LDI r12, 387
LDI r13, 78
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
