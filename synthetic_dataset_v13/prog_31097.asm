; DESCRIPTION: Composite: Sets a single magenta pixel at (225, 226) then Places a red line segment connecting (160, 184) to (401, 244) then Places a red 24x59 rectangle at position (304, 184).
; PLAN: r0=225(x), r1=226(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=160(x1), r6=184(y1), r7=401(x2), r8=244(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=304(x), r11=184(y), r12=24(width), r13=59(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 226
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 160
LDI r6, 184
LDI r7, 401
LDI r8, 244
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 304
LDI r11, 184
LDI r12, 24
LDI r13, 59
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
