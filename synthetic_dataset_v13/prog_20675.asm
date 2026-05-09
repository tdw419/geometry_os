; DESCRIPTION: Draws a cyan line from (494, 205) to (197, 212).
; PLAN: r0=494(x1), r1=205(y1), r2=197(x2), r3=212(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 205
LDI r2, 197
LDI r3, 212
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
