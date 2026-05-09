; DESCRIPTION: Composite: Places a blue dot at position (502, 47) then Renders a blue line between points (357, 55) and (171, 38) then Renders a green box of size 69x98 starting at (205, 57).
; PLAN: r0=502(x), r1=47(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=357(x1), r6=55(y1), r7=171(x2), r8=38(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=205(x), r11=57(y), r12=69(width), r13=98(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 502
LDI r1, 47
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 357
LDI r6, 55
LDI r7, 171
LDI r8, 38
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 205
LDI r11, 57
LDI r12, 69
LDI r13, 98
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
