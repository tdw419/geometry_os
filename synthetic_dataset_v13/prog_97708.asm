; DESCRIPTION: Composite: Renders a black disk with center (127, 214) and radius 18 then Renders a cyan line between points (48, 32) and (215, 73) then Renders a purple box of size 106x54 starting at (73, 71).
; PLAN: r0=127(x), r1=214(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x1), r6=32(y1), r7=215(x2), r8=73(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=71(y), r12=106(width), r13=54(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 214
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 32
LDI r7, 215
LDI r8, 73
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 71
LDI r12, 106
LDI r13, 54
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
