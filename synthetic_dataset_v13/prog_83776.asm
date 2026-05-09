; DESCRIPTION: Composite: Places a magenta dot at position (446, 238) then Renders a magenta box of size 61x38 starting at (369, 6) then Places a white line segment connecting (91, 243) to (444, 187).
; PLAN: r0=446(x), r1=238(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=6(y), r7=61(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=91(x1), r11=243(y1), r12=444(x2), r13=187(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 238
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 369
LDI r6, 6
LDI r7, 61
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 243
LDI r12, 444
LDI r13, 187
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
