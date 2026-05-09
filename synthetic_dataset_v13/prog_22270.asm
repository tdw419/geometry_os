; DESCRIPTION: Draws a cyan line from (303, 76) to (304, 204).
; PLAN: r0=303(x1), r1=76(y1), r2=304(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 76
LDI r2, 304
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
