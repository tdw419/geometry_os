; DESCRIPTION: Draws a cyan line from (65, 23) to (281, 136).
; PLAN: r0=65(x1), r1=23(y1), r2=281(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 23
LDI r2, 281
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
