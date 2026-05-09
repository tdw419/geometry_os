; DESCRIPTION: Composite: Renders a black box of size 75x111 starting at (400, 16) then Places a red circle of radius 64 at center (275, 66) then Renders a cyan line between points (473, 174) and (139, 208).
; PLAN: r0=400(x), r1=16(y), r2=75(width), r3=111(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=66(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=473(x1), r11=174(y1), r12=139(x2), r13=208(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 16
LDI r2, 75
LDI r3, 111
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 66
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 473
LDI r11, 174
LDI r12, 139
LDI r13, 208
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
