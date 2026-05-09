; DESCRIPTION: Composite: Renders a white line between points (20, 215) and (349, 126) then Places a green dot at position (400, 247) then Renders a magenta box of size 23x38 starting at (161, 9).
; PLAN: r0=20(x1), r1=215(y1), r2=349(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=247(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=161(x), r11=9(y), r12=23(width), r13=38(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 20
LDI r1, 215
LDI r2, 349
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 247
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 161
LDI r11, 9
LDI r12, 23
LDI r13, 38
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
