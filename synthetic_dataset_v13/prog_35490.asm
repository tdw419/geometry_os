; DESCRIPTION: Draws a cyan line from (486, 154) to (396, 5).
; PLAN: r0=486(x1), r1=154(y1), r2=396(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 154
LDI r2, 396
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
