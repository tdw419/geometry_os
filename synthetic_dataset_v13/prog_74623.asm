; DESCRIPTION: Composite: Places a magenta dot at position (459, 42) then Draws a white line from (142, 129) to (291, 153) then Places a yellow 79x37 rectangle at position (33, 136).
; PLAN: r0=459(x), r1=42(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=142(x1), r6=129(y1), r7=291(x2), r8=153(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=33(x), r11=136(y), r12=79(width), r13=37(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 459
LDI r1, 42
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 142
LDI r6, 129
LDI r7, 291
LDI r8, 153
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 33
LDI r11, 136
LDI r12, 79
LDI r13, 37
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
