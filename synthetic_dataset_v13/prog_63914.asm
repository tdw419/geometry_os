; DESCRIPTION: Composite: Creates a red rectangular region at (40, 50) spanning 48 by 97 pixels then Renders a green disk with center (76, 107) and radius 38 then Sets a single white pixel at (502, 54).
; PLAN: r0=40(x), r1=50(y), r2=48(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x), r6=107(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=502(x), r11=54(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 50
LDI r2, 48
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 107
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 502
LDI r11, 54
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
