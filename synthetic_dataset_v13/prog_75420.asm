; DESCRIPTION: Draws a green line from (126, 207) to (295, 24).
; PLAN: r0=126(x1), r1=207(y1), r2=295(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 207
LDI r2, 295
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
