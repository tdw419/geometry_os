; DESCRIPTION: Composite: Renders a yellow disk with center (291, 168) and radius 34 then Renders a green box of size 38x11 starting at (24, 91).
; PLAN: r0=291(x), r1=168(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x), r6=91(y), r7=38(width), r8=11(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 291
LDI r1, 168
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 91
LDI r7, 38
LDI r8, 11
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
