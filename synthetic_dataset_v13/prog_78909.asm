; DESCRIPTION: Composite: Places a orange dot at position (127, 167) then Renders a green line between points (401, 120) and (148, 251) then Places a blue 27x12 rectangle at position (470, 16).
; PLAN: r0=127(x), r1=167(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=401(x1), r6=120(y1), r7=148(x2), r8=251(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=470(x), r11=16(y), r12=27(width), r13=12(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 167
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 401
LDI r6, 120
LDI r7, 148
LDI r8, 251
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 16
LDI r12, 27
LDI r13, 12
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
