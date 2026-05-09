; DESCRIPTION: Draws a cyan line from (206, 54) to (92, 27).
; PLAN: r0=206(x1), r1=54(y1), r2=92(x2), r3=27(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 54
LDI r2, 92
LDI r3, 27
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
