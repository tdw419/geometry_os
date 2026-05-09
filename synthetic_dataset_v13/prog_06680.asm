; DESCRIPTION: Composite: Renders a cyan box of size 16x35 starting at (372, 140) then Renders a green line between points (108, 114) and (421, 92).
; PLAN: r0=372(x), r1=140(y), r2=16(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x1), r6=114(y1), r7=421(x2), r8=92(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 372
LDI r1, 140
LDI r2, 16
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 114
LDI r7, 421
LDI r8, 92
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
