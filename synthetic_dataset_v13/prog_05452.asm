; DESCRIPTION: Draws a cyan line from (129, 239) to (428, 71).
; PLAN: r0=129(x1), r1=239(y1), r2=428(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 239
LDI r2, 428
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
