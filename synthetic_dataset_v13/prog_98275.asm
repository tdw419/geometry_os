; DESCRIPTION: Composite: Draws a red rectangle at (182, 129) with width 42 and height 111 then Renders a red disk with center (168, 146) and radius 80.
; PLAN: r0=182(x), r1=129(y), r2=42(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=168(x), r6=146(y), r7=80(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 129
LDI r2, 42
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 146
LDI r7, 80
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
