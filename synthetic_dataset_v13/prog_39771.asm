; DESCRIPTION: Draws a cyan line from (364, 167) to (403, 125).
; PLAN: r0=364(x1), r1=167(y1), r2=403(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 167
LDI r2, 403
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
