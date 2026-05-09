; DESCRIPTION: Composite: Renders a green disk with center (236, 133) and radius 66 then Creates a cyan rectangular region at (229, 36) spanning 42 by 26 pixels.
; PLAN: r0=236(x), r1=133(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=229(x), r6=36(y), r7=42(width), r8=26(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 236
LDI r1, 133
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 229
LDI r6, 36
LDI r7, 42
LDI r8, 26
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
