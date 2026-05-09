; DESCRIPTION: Composite: Places a yellow circle of radius 22 at center (146, 232) then Renders a cyan box of size 10x64 starting at (153, 61) then Places a cyan line segment connecting (92, 194) to (415, 240).
; PLAN: r0=146(x), r1=232(y), r2=22(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=61(y), r7=10(width), r8=64(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=92(x1), r11=194(y1), r12=415(x2), r13=240(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 232
LDI r2, 22
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 61
LDI r7, 10
LDI r8, 64
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 92
LDI r11, 194
LDI r12, 415
LDI r13, 240
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
