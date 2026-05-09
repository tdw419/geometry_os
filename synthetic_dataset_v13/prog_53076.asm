; DESCRIPTION: Composite: Places a magenta dot at position (400, 162) then Places a green 68x83 rectangle at position (196, 93) then Renders a blue line between points (305, 138) and (426, 222).
; PLAN: r0=400(x), r1=162(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=196(x), r6=93(y), r7=68(width), r8=83(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x1), r11=138(y1), r12=426(x2), r13=222(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 162
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 196
LDI r6, 93
LDI r7, 68
LDI r8, 83
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 138
LDI r12, 426
LDI r13, 222
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
