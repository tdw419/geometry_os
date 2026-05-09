; DESCRIPTION: Composite: Places a magenta circle of radius 40 at center (383, 113) then Renders a white line between points (345, 221) and (165, 221) then Renders a cyan box of size 27x99 starting at (189, 44).
; PLAN: r0=383(x), r1=113(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=345(x1), r6=221(y1), r7=165(x2), r8=221(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=44(y), r12=27(width), r13=99(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 113
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 345
LDI r6, 221
LDI r7, 165
LDI r8, 221
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 44
LDI r12, 27
LDI r13, 99
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
