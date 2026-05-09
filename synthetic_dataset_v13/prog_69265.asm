; DESCRIPTION: Composite: Renders a cyan line between points (57, 245) and (384, 1) then Creates a orange rectangular region at (71, 149) spanning 52 by 45 pixels.
; PLAN: r0=57(x1), r1=245(y1), r2=384(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=149(y), r7=52(width), r8=45(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 245
LDI r2, 384
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 149
LDI r7, 52
LDI r8, 45
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
