; DESCRIPTION: Composite: Draws a green circle centered at (213, 124) with radius 77 then Places a red 103x25 rectangle at position (293, 30) then Renders a magenta line between points (161, 144) and (120, 187).
; PLAN: r0=213(x), r1=124(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=293(x), r6=30(y), r7=103(width), r8=25(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=161(x1), r11=144(y1), r12=120(x2), r13=187(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 213
LDI r1, 124
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 293
LDI r6, 30
LDI r7, 103
LDI r8, 25
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 161
LDI r11, 144
LDI r12, 120
LDI r13, 187
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
