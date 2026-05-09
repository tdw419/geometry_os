; DESCRIPTION: Composite: Renders a cyan disk with center (201, 81) and radius 71 then Draws a black line from (367, 41) to (414, 245) then Places a blue 24x83 rectangle at position (263, 125).
; PLAN: r0=201(x), r1=81(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x1), r6=41(y1), r7=414(x2), r8=245(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=125(y), r12=24(width), r13=83(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 81
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 41
LDI r7, 414
LDI r8, 245
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 125
LDI r12, 24
LDI r13, 83
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
