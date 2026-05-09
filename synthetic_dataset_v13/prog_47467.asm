; DESCRIPTION: Draws a cyan line from (114, 216) to (197, 30).
; PLAN: r0=114(x1), r1=216(y1), r2=197(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 216
LDI r2, 197
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
