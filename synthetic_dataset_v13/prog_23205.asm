; DESCRIPTION: Composite: Places a red 98x86 rectangle at position (85, 85) then Renders a yellow disk with center (95, 111) and radius 78.
; PLAN: r0=85(x), r1=85(y), r2=98(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=95(x), r6=111(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 85
LDI r1, 85
LDI r2, 98
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 111
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
