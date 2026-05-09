; DESCRIPTION: Composite: Places a black dot at position (215, 178) then Places a black line segment connecting (214, 39) to (469, 26) then Renders a cyan disk with center (99, 19) and radius 18.
; PLAN: r0=215(x), r1=178(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=214(x1), r6=39(y1), r7=469(x2), r8=26(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=99(x), r11=19(y), r12=18(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 215
LDI r1, 178
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 214
LDI r6, 39
LDI r7, 469
LDI r8, 26
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 99
LDI r11, 19
LDI r12, 18
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
