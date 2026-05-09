; DESCRIPTION: Composite: Renders a white line between points (120, 166) and (153, 62) then Renders a cyan box of size 75x73 starting at (281, 82).
; PLAN: r0=120(x1), r1=166(y1), r2=153(x2), r3=62(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=82(y), r7=75(width), r8=73(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 166
LDI r2, 153
LDI r3, 62
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 82
LDI r7, 75
LDI r8, 73
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
