; DESCRIPTION: Composite: Places a white 74x44 rectangle at position (249, 143) then Renders a cyan line between points (321, 214) and (22, 92).
; PLAN: r0=249(x), r1=143(y), r2=74(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=321(x1), r6=214(y1), r7=22(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 143
LDI r2, 74
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 214
LDI r7, 22
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
