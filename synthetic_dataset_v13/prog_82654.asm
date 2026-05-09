; DESCRIPTION: Composite: Renders a cyan box of size 80x47 starting at (174, 130) then Places a red circle of radius 34 at center (330, 175).
; PLAN: r0=174(x), r1=130(y), r2=80(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=330(x), r6=175(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 174
LDI r1, 130
LDI r2, 80
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 175
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
