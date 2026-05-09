; DESCRIPTION: Draws a cyan line from (218, 196) to (29, 25).
; PLAN: r0=218(x1), r1=196(y1), r2=29(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 196
LDI r2, 29
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
