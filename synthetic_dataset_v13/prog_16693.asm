; DESCRIPTION: Draws a cyan line from (440, 196) to (134, 45).
; PLAN: r0=440(x1), r1=196(y1), r2=134(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 196
LDI r2, 134
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
