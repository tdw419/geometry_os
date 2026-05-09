; DESCRIPTION: Composite: Creates a yellow circular shape at (187, 154) with radius 51 then Renders a yellow box of size 51x22 starting at (284, 193).
; PLAN: r0=187(x), r1=154(y), r2=51(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=193(y), r7=51(width), r8=22(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 187
LDI r1, 154
LDI r2, 51
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 193
LDI r7, 51
LDI r8, 22
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
