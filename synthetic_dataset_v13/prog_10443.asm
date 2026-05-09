; DESCRIPTION: Composite: Places a green circle of radius 31 at center (397, 31) then Renders a yellow box of size 27x31 starting at (146, 202) then Renders a cyan line between points (470, 71) and (480, 49).
; PLAN: r0=397(x), r1=31(y), r2=31(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x), r6=202(y), r7=27(width), r8=31(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=470(x1), r11=71(y1), r12=480(x2), r13=49(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 31
LDI r2, 31
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 202
LDI r7, 27
LDI r8, 31
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 470
LDI r11, 71
LDI r12, 480
LDI r13, 49
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
