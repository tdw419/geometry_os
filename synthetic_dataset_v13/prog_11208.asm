; DESCRIPTION: Composite: Creates a green rectangular region at (198, 82) spanning 12 by 55 pixels then Renders a cyan disk with center (123, 37) and radius 10.
; PLAN: r0=198(x), r1=82(y), r2=12(width), r3=55(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=37(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 198
LDI r1, 82
LDI r2, 12
LDI r3, 55
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 37
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
