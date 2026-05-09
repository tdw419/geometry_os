; DESCRIPTION: Composite: Renders a green disk with center (399, 189) and radius 44 then Draws a cyan line from (134, 67) to (241, 15) then Places a cyan 21x48 rectangle at position (360, 69).
; PLAN: r0=399(x), r1=189(y), r2=44(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x1), r6=67(y1), r7=241(x2), r8=15(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=69(y), r12=21(width), r13=48(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 189
LDI r2, 44
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 67
LDI r7, 241
LDI r8, 15
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 69
LDI r12, 21
LDI r13, 48
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
