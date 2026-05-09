; DESCRIPTION: Composite: Places a cyan 56x87 rectangle at position (229, 49) then Draws a black line from (336, 71) to (437, 27).
; PLAN: r0=229(x), r1=49(y), r2=56(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=71(y1), r7=437(x2), r8=27(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 49
LDI r2, 56
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 71
LDI r7, 437
LDI r8, 27
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
