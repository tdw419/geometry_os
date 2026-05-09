; DESCRIPTION: Composite: Renders a cyan box of size 92x71 starting at (167, 1) then Renders a white line between points (31, 231) and (329, 120).
; PLAN: r0=167(x), r1=1(y), r2=92(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=31(x1), r6=231(y1), r7=329(x2), r8=120(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 1
LDI r2, 92
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 31
LDI r6, 231
LDI r7, 329
LDI r8, 120
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
