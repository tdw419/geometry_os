; DESCRIPTION: Draws a cyan line from (307, 211) to (421, 70).
; PLAN: r0=307(x1), r1=211(y1), r2=421(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 211
LDI r2, 421
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
