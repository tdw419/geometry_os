; DESCRIPTION: Draws a green line from (9, 197) to (317, 213).
; PLAN: r0=9(x1), r1=197(y1), r2=317(x2), r3=213(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 197
LDI r2, 317
LDI r3, 213
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
