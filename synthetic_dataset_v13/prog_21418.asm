; DESCRIPTION: Draws a cyan line from (197, 175) to (94, 166).
; PLAN: r0=197(x1), r1=175(y1), r2=94(x2), r3=166(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 175
LDI r2, 94
LDI r3, 166
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
