; DESCRIPTION: Draws a cyan line from (502, 62) to (109, 124).
; PLAN: r0=502(x1), r1=62(y1), r2=109(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 62
LDI r2, 109
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
