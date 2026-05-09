; DESCRIPTION: Composite: Sets a single magenta pixel at (501, 32) then Places a red 83x33 rectangle at position (280, 167) then Renders a blue line between points (266, 226) and (371, 177).
; PLAN: r0=501(x), r1=32(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=280(x), r6=167(y), r7=83(width), r8=33(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=266(x1), r11=226(y1), r12=371(x2), r13=177(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 501
LDI r1, 32
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 280
LDI r6, 167
LDI r7, 83
LDI r8, 33
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 266
LDI r11, 226
LDI r12, 371
LDI r13, 177
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
