; DESCRIPTION: Draws a cyan line from (58, 213) to (57, 182).
; PLAN: r0=58(x1), r1=213(y1), r2=57(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 213
LDI r2, 57
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
