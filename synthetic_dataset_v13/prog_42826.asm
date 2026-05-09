; DESCRIPTION: Draws a cyan line from (279, 180) to (281, 230).
; PLAN: r0=279(x1), r1=180(y1), r2=281(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 180
LDI r2, 281
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
