; DESCRIPTION: Composite: Creates a cyan circular shape at (108, 108) with radius 44 then Renders a yellow line between points (276, 42) and (247, 76).
; PLAN: r0=108(x), r1=108(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x1), r6=42(y1), r7=247(x2), r8=76(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 108
LDI r1, 108
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 42
LDI r7, 247
LDI r8, 76
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
