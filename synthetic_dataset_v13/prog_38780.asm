; DESCRIPTION: Composite: Places a cyan line segment connecting (432, 243) to (329, 187) then Places a red 94x30 rectangle at position (51, 70).
; PLAN: r0=432(x1), r1=243(y1), r2=329(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=70(y), r7=94(width), r8=30(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 432
LDI r1, 243
LDI r2, 329
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 70
LDI r7, 94
LDI r8, 30
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
