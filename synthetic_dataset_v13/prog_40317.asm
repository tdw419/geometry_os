; DESCRIPTION: Draws a cyan line from (502, 5) to (414, 227).
; PLAN: r0=502(x1), r1=5(y1), r2=414(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 5
LDI r2, 414
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
