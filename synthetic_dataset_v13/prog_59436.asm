; DESCRIPTION: Composite: Creates a purple circular shape at (95, 164) with radius 80 then Renders a black box of size 27x59 starting at (58, 146).
; PLAN: r0=95(x), r1=164(y), r2=80(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=58(x), r6=146(y), r7=27(width), r8=59(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 164
LDI r2, 80
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 58
LDI r6, 146
LDI r7, 27
LDI r8, 59
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
