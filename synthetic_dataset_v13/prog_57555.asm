; DESCRIPTION: Composite: Places a green 62x41 rectangle at position (271, 156) then Renders a white line between points (57, 91) and (177, 73).
; PLAN: r0=271(x), r1=156(y), r2=62(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=57(x1), r6=91(y1), r7=177(x2), r8=73(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 156
LDI r2, 62
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 57
LDI r6, 91
LDI r7, 177
LDI r8, 73
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
