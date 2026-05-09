; DESCRIPTION: Draws a cyan line from (105, 154) to (420, 124).
; PLAN: r0=105(x1), r1=154(y1), r2=420(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 154
LDI r2, 420
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
