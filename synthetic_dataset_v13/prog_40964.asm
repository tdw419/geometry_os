; DESCRIPTION: Composite: Renders a cyan line between points (22, 192) and (458, 152) then Places a yellow 95x83 rectangle at position (156, 57).
; PLAN: r0=22(x1), r1=192(y1), r2=458(x2), r3=152(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=156(x), r6=57(y), r7=95(width), r8=83(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 192
LDI r2, 458
LDI r3, 152
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 156
LDI r6, 57
LDI r7, 95
LDI r8, 83
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
