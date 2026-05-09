; DESCRIPTION: Composite: Places a green dot at position (76, 174) then Places a blue 120x72 rectangle at position (254, 161) then Renders a magenta line between points (52, 214) and (16, 225).
; PLAN: r0=76(x), r1=174(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=161(y), r7=120(width), r8=72(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=52(x1), r11=214(y1), r12=16(x2), r13=225(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 174
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 254
LDI r6, 161
LDI r7, 120
LDI r8, 72
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 52
LDI r11, 214
LDI r12, 16
LDI r13, 225
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
