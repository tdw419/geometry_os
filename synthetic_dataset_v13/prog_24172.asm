; DESCRIPTION: Draws a cyan line from (504, 204) to (414, 26).
; PLAN: r0=504(x1), r1=204(y1), r2=414(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 204
LDI r2, 414
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
