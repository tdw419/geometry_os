; DESCRIPTION: Draws a cyan line from (304, 121) to (48, 249).
; PLAN: r0=304(x1), r1=121(y1), r2=48(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 121
LDI r2, 48
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
