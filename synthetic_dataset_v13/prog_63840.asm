; DESCRIPTION: Composite: Places a yellow 57x42 rectangle at position (3, 181) then Draws a cyan line from (29, 31) to (77, 238).
; PLAN: r0=3(x), r1=181(y), r2=57(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=29(x1), r6=31(y1), r7=77(x2), r8=238(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 3
LDI r1, 181
LDI r2, 57
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 31
LDI r7, 77
LDI r8, 238
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
