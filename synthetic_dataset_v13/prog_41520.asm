; DESCRIPTION: Composite: Places a green dot at position (192, 142) then Places a cyan line segment connecting (243, 219) to (469, 39) then Renders a yellow box of size 83x113 starting at (262, 19).
; PLAN: r0=192(x), r1=142(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=243(x1), r6=219(y1), r7=469(x2), r8=39(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=262(x), r11=19(y), r12=83(width), r13=113(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 192
LDI r1, 142
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 243
LDI r6, 219
LDI r7, 469
LDI r8, 39
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 19
LDI r12, 83
LDI r13, 113
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
