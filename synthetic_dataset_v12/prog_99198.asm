; DESCRIPTION: Composite: Places a magenta 78x54 rectangle at position (382, 14) then Renders a cyan line between points (401, 72) and (181, 75).
; PLAN: r0=382(x), r1=14(y), r2=78(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x1), r6=72(y1), r7=181(x2), r8=75(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 14
LDI r2, 78
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 72
LDI r7, 181
LDI r8, 75
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
