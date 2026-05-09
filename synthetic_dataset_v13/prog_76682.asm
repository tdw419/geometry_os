; DESCRIPTION: Composite: Creates a cyan rectangular region at (302, 120) spanning 42 by 43 pixels then Draws a green circle centered at (300, 209) with radius 24.
; PLAN: r0=302(x), r1=120(y), r2=42(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=209(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 302
LDI r1, 120
LDI r2, 42
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 209
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
