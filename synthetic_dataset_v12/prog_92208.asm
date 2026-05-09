; DESCRIPTION: Composite: Renders a black disk with center (146, 135) and radius 54 then Places a white 94x66 rectangle at position (323, 59).
; PLAN: r0=146(x), r1=135(y), r2=54(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=59(y), r7=94(width), r8=66(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 135
LDI r2, 54
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 59
LDI r7, 94
LDI r8, 66
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
