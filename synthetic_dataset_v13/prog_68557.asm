; DESCRIPTION: Composite: Renders a green box of size 113x16 starting at (95, 33) then Renders a purple disk with center (77, 129) and radius 25.
; PLAN: r0=95(x), r1=33(y), r2=113(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=77(x), r6=129(y), r7=25(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 95
LDI r1, 33
LDI r2, 113
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 129
LDI r7, 25
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
