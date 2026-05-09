; DESCRIPTION: Composite: Renders a red box of size 77x73 starting at (253, 27) then Places a blue line segment connecting (400, 168) to (304, 193) then Places a red dot at position (52, 208).
; PLAN: r0=253(x), r1=27(y), r2=77(width), r3=73(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=168(y1), r7=304(x2), r8=193(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=52(x), r11=208(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 253
LDI r1, 27
LDI r2, 77
LDI r3, 73
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 168
LDI r7, 304
LDI r8, 193
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 208
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
