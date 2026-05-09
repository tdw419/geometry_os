; DESCRIPTION: Composite: Creates a cyan circular shape at (24, 42) with radius 21 then Renders a white line between points (72, 246) and (481, 124).
; PLAN: r0=24(x), r1=42(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=72(x1), r6=246(y1), r7=481(x2), r8=124(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 24
LDI r1, 42
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 72
LDI r6, 246
LDI r7, 481
LDI r8, 124
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
