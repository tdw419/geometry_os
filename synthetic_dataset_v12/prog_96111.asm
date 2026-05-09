; DESCRIPTION: Composite: Sets a single cyan pixel at (181, 24) then Creates a cyan rectangular region at (387, 204) spanning 20 by 52 pixels then Places a green line segment connecting (191, 120) to (175, 168).
; PLAN: r0=181(x), r1=24(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=204(y), r7=20(width), r8=52(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=191(x1), r11=120(y1), r12=175(x2), r13=168(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 24
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 387
LDI r6, 204
LDI r7, 20
LDI r8, 52
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 191
LDI r11, 120
LDI r12, 175
LDI r13, 168
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
