; DESCRIPTION: Composite: Creates a blue circular shape at (410, 84) with radius 59 then Renders a yellow box of size 50x32 starting at (168, 33).
; PLAN: r0=410(x), r1=84(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=33(y), r7=50(width), r8=32(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 84
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 33
LDI r7, 50
LDI r8, 32
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
