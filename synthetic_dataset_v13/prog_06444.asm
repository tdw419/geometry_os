; DESCRIPTION: Composite: Draws a yellow circle centered at (408, 202) with radius 37 then Renders a yellow box of size 61x58 starting at (214, 167).
; PLAN: r0=408(x), r1=202(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=167(y), r7=61(width), r8=58(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 408
LDI r1, 202
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 167
LDI r7, 61
LDI r8, 58
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
