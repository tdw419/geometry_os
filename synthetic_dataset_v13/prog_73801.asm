; DESCRIPTION: Composite: Sets a single cyan pixel at (346, 121) then Draws a black rectangle at (245, 30) with width 68 and height 111 then Places a blue line segment connecting (76, 47) to (324, 142).
; PLAN: r0=346(x), r1=121(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=245(x), r6=30(y), r7=68(width), r8=111(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=76(x1), r11=47(y1), r12=324(x2), r13=142(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 121
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 245
LDI r6, 30
LDI r7, 68
LDI r8, 111
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 47
LDI r12, 324
LDI r13, 142
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
